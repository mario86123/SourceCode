// Loss Less MST model

#include "LLMST.h"
#include "Tools.h"
#include <errno.h>
#include <fcntl.h>
#include <string.h>
#include <math.h>
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <list>
#include <vector>
using std::cerr;
using std::cout;
using std::endl;

double update_entropy(double original_entropy, double deleted_element, double summation) {

    original_entropy = original_entropy * (-1);
    double new_sum = summation - deleted_element;
    double deleted_element_entropy =  (deleted_element / summation) * log(deleted_element / summation);
    return (-1) * (summation / new_sum) * (  original_entropy - deleted_element_entropy + (new_sum / summation) * log(summation / new_sum));
}

/*
 * Class constructor.
 */
CLLMST::CLLMST(int problem_size, int sel_size, double b_ratio)
{
	m_problem_size=problem_size;
    m_sample_size=sel_size;
    m_samples= new int*[m_sample_size];

    
    m_edge_matrix = new double**[m_problem_size];
    for (int i = 0; i < m_problem_size; ++i) {
        m_edge_matrix[i] = new double*[m_problem_size];
        // m_edge_matrix[i][j][1] = node i is before node j for 1 position
        for (int j = 0; j < m_problem_size; ++j) {
            m_edge_matrix[i][j] = new double[m_problem_size]();
        }
    }


    // m_node_matrix[i][j] = node j position is node i
    m_node_matrix = new double*[m_problem_size];
    for (int i = 0; i < m_problem_size; ++i) {
        m_node_matrix[i] = new double[m_problem_size]();
    }



    // epsilon = b * ell / pop_size
    m_epsilon = double(m_problem_size * b_ratio) / (m_sample_size); // pop_size = sample_size

    m_mst_edge_arr = new edge[m_problem_size - 1];
    m_mst_node_arr = new node[m_problem_size];


    // ----- normalize MST edge entropy and node entropy ----- //
        // edge: n - 1, node: n
    // double max_entropy_arr[m_problem_size];
    // for (int i = 0; i < m_problem_size; i++) {
    //     max_entropy_arr[i] = 1.0;
    // }

    // m_node_max_entropy = calculate_entropy(max_entropy_arr, m_problem_size);
    // m_edge_max_entropy = calculate_entropy(max_entropy_arr, m_problem_size - 1);

}









CLLMST::~CLLMST()
{
    // PrintMRMatrix(m_multiple_relation_matrix, m_problem_size);

    delete [] m_samples;

    // Release edge matrix Memory
    for(int i = 0; i < m_problem_size; ++i){
        for(int j = 0; j < m_problem_size; ++j){
            delete[] m_edge_matrix[i][j];
        }
        delete[] m_edge_matrix[i];
    }
    delete[] m_edge_matrix;
    


    // Release node matrix Memory
    for(int i = 0; i < m_problem_size; ++i){
        delete[] m_node_matrix[i];
    }
    delete[] m_node_matrix;

    delete[] m_mst_edge_arr;
    delete[] m_mst_node_arr;

}






/*
 * Virtual learning function.
 */
bool CLLMST::Learn(CPopulation * population, int size)
{   


    time_t start, end;
    start = clock();

    end = clock();
    cout << "learn model time: " << start - end << endl;

    // clean matrix
    // m_edge_matrix[i][j][1] = node i is before node j for 1 position
    for(int ref_node = 0; ref_node < m_problem_size; ++ref_node){
        for(int sample_node = 0; sample_node < m_problem_size; ++sample_node){
            for(int dist = 0; dist < m_problem_size; ++dist){
                
                if (ref_node != sample_node && dist != 0) {
                    m_edge_matrix[ref_node][sample_node][dist] = m_epsilon;
                }
                else {
                    m_edge_matrix[ref_node][sample_node][dist] = 0.0;
                }
            }
        }
    }

    for(int i = 0; i < m_problem_size; ++i) {
        for(int j = 0; j < m_problem_size; ++j) {
            m_node_matrix[i][j] = m_epsilon;
        }    
    }    
    



    // selection ?????
    // selection ?????
    // selection ?????
    // printf("sample:\n");
    for(int k=0;k<size;k++) {
		m_samples[k] = population->m_individuals[k]->Genes();
        

        // build edge matrix
        for (int reference_node_idx = 0; reference_node_idx < m_problem_size; ++reference_node_idx) {
            for (int distance = 0; distance < m_problem_size; ++distance) { // next node
                int next_node_idx = reference_node_idx + distance;
                if (next_node_idx >= m_problem_size) {
                    next_node_idx -= m_problem_size;
                }
                // m_edge_matrix[i][j][1] = node i is before node j for 1 position
                m_edge_matrix[ m_samples[k][reference_node_idx] ][ m_samples[k][next_node_idx] ][distance] ++;
            }
        }

        // build node matrix
        // m_node_matrix[i][j] = node i position is idx j
        for (int pos = 0; pos < m_problem_size; ++pos) {
            m_node_matrix[m_samples[k][pos]][pos] ++;
        }


    }
    // PrintMSTEdgeMatrix(m_edge_matrix, m_problem_size);

    // printf("pos / node:");
    // PrintMatrix(m_node_matrix, m_problem_size);






    // === build MST part === //
    
    int total_edge_num = m_problem_size * (m_problem_size - 1) / 2;

    // find every node and node biggest element edge
    vector<edge> all_edge(total_edge_num);
    int count = 0;

    for (int ref_node_num = 0; ref_node_num < m_problem_size; ++ref_node_num) {
        for (int other_node_num = ref_node_num + 1; other_node_num < m_problem_size; ++other_node_num) {

            double max_element = 0;
            int max_element_distance = 0;

            for (int distance = 1; distance < m_problem_size; ++distance) {

                if (m_edge_matrix[ref_node_num][other_node_num][distance] > max_element) {
                    max_element = m_edge_matrix[ref_node_num][other_node_num][distance];
                    max_element_distance = distance;
                }

            }
            

            all_edge[count].node_a = ref_node_num;
            all_edge[count].node_b = other_node_num;
            all_edge[count].length = max_element;
            all_edge[count].entropy = 0.0;

            count ++;
        }
    }
    // remain ell x (ell-1) / 2 edges




    // --- build MST --- //

    // sort remaining ell x (ell-1) / 2 edges
    sort( all_edge.begin(),all_edge.end(), [&](edge i,edge j) { return i.length>j.length; } );
    


    int mst_edge_count = 0;
    element node_set[m_problem_size];


    // union find initialization
    for(int i = 0; i < m_problem_size; ++i) {
        node_set[i].parent = i;
        node_set[i].rank = 0;
    }


    // union find
    // while MST is not ready (for each edge in all edge)
    for (edge e: all_edge) {

        // if add that edge (AB) does not forming a cycle ( find-set(A) != find-set(B) )
        if (find_set(e.node_a, node_set) != find_set(e.node_b, node_set)) {
            
            // add that edge to graph
            union_set(e.node_a, e.node_b, node_set);
            m_mst_edge_arr[mst_edge_count] = e;
            mst_edge_count ++;

            if (mst_edge_count >= m_problem_size - 1) break;
        }
    }
    // --- MST finished --- //
    

    


    // calculate edge entropy ratio
    for (int i = 0; i < m_problem_size - 1; ++i) {
        m_mst_edge_arr[i].entropy = calculate_entropy(m_edge_matrix[m_mst_edge_arr[i].node_a][m_mst_edge_arr[i].node_b], m_problem_size);
        m_mst_edge_arr[i].sum = sum_arr(m_edge_matrix[m_mst_edge_arr[i].node_a][m_mst_edge_arr[i].node_b], m_problem_size);

    }

    // calculate node entropy ratio
    for (int i = 0; i < m_problem_size; ++i) {
        m_mst_node_arr[i].node_num = i;
        m_mst_node_arr[i].entropy = calculate_entropy(m_node_matrix[i], m_problem_size);
        m_mst_node_arr[i].sum = sum_arr(m_node_matrix[i], m_problem_size);
    }

    return true;
}








/*
 * Virtual sampling function.
 */
void CLLMST::Sample(int * genes)
{

    time_t start, end, loop_start, loop_end;
    
    time_t NC = 0, NS = 0, NU = 0, EC = 0, ES = 0, EU = 0, sample = 0;

    start = clock();

    // --- m_mst_node_lst initialization --- //
    struct mst_node {
        int node_num;
        double element_sum;
        double entropy;
        // double *arr;
    };

    mst_node mst_node_lst[m_problem_size];
    for (int num = 0; num < m_problem_size; num++) {
        mst_node_lst[num].node_num = num;
        mst_node_lst[num].element_sum = m_mst_node_arr[num].sum;
        mst_node_lst[num].entropy = m_mst_node_arr[num].entropy;
        // mst_node_lst[num].arr = 
    }
    // --- end of m_mst_node_lst initialization --- //




    // --- m_mst_edge_lst initialization --- //
    struct mst_edge {
        int node_a;
        int node_b;
        double element_sum;
        double entropy;
        // double *arr;
        int status; 
            // 0: both two node are not sampled
            // 1: node_a is already sampled
            // 2: node_b is already sampled
            // 3; both two node are already sampled
        int ref_node_idx;
    };

    mst_edge mst_edge_lst[m_problem_size - 1];
    for (int num = 0; num < m_problem_size - 1 ; num++) {
        mst_edge_lst[num].node_a = m_mst_edge_arr[num].node_a;
        mst_edge_lst[num].node_b =  m_mst_edge_arr[num].node_b;
        mst_edge_lst[num].element_sum = m_mst_edge_arr[num].sum;
        mst_edge_lst[num].entropy = m_mst_edge_arr[num].entropy;
        // cout << "m_mst_edge_arr[num].entropy: " << m_mst_edge_arr[num].entropy << endl;
        // mst_node_lst[num].arr = 
        mst_edge_lst[num].status = 0; // 1: node_a is already sampled, 2: node_b is already sampled
        mst_edge_lst[num].ref_node_idx = -1;
    }
    // --- end of m_mst_edge_lst initialization --- //
    // ----- end of initialization ----- //


    // already sampled index array
    // int already_sampled_index_arr[m_problem_size]; // store aleady sampled index
    
    bool is_sampled_node[m_problem_size];
    bool is_sampled_index[m_problem_size];

    for (int i = 0; i < m_problem_size; i ++) {
        is_sampled_node[i] = false;
        is_sampled_index[i] = false;
    }

    end = clock();
    cout << "initialization time: " << start - end << endl;


    loop_start = clock();
    for (int sample_count = 0; sample_count < m_problem_size; sample_count++) {


        start = clock();

        // [node] choose lowest entropy ratio array
        int min_entropy_node_num = -1;
        double node_min_entropy = 100;

        for (int i = 0; i < m_problem_size; i ++) {
            if (is_sampled_node[i] == false && node_min_entropy - mst_node_lst[i].entropy > 0.001) {
                
                min_entropy_node_num = i;
                node_min_entropy = mst_node_lst[i].entropy;
                // cout << "min_entropy_node_num: " << min_entropy_node_num << endl;

            }
        }

        end = clock();
        NC += start - end;
        // cout << "[node] choose lowest entropy ratio array time: " << start - end << endl;
        start = clock();




        // [edge] choose lowest entropy ratio array (not all edges in mst can be compared)
        int min_entropy_edge_num = -1;
        double edge_min_entropy = 100;
        for (int i = 0; i < m_problem_size - 1; i ++) {
            // if (status == 1) or (status == 2)
            if (mst_edge_lst[i].status == 1 || mst_edge_lst[i].status == 2 ) {
                // cout << i<< " th ee: "<< mst_edge_lst[i].entropy << ", a: " << mst_edge_lst[i].node_a<<", b: " << mst_edge_lst[i].node_b<< endl;

                if (edge_min_entropy - mst_edge_lst[i].entropy > 0.001) {
                    min_entropy_edge_num = i;
                    edge_min_entropy = mst_edge_lst[i].entropy;
                }
            }
        }

        // cout << "[edge] choose lowest entropy ratio array time: " << start - end << endl;

        end = clock();
        EC += start - end;
        start = clock();


        // normalize edge and node entropy
            // todo



        // --- determine which array to sample --- //
        double sample_arr[m_problem_size];
        int sample_node_num;

        // cout << "node_min_entropy: " << node_min_entropy << ", edge_min_entropy: " << edge_min_entropy << endl;
        // cout << "node_min_entropy - edge_min_entropy: " << (node_min_entropy - edge_min_entropy) << endl;

        // compare node and edge lowest entropy ratio
        // if (node_min_entropy < edge_min_entropy ) { // use node arr to sample
        if (node_min_entropy - edge_min_entropy < 0.001) { // use node arr to sample
            // cout << "node_min_entropy: " << node_min_entropy <<endl;
            for (int i = 0; i < m_problem_size; i ++) {
                if (is_sampled_index[i] == false) { // that index is not sampled yet
                    sample_arr[i] = m_node_matrix[min_entropy_node_num][i];
                }
                else  {// that index is already sampled
                    sample_arr[i] = 0.0;
                }
            }
            sample_node_num = min_entropy_node_num;
            
            // cout << "use node arr to sample (assign sample arr): " << start - end << endl;

            end = clock();
            NS += start - end;            
            start = clock();


        }

        else { // if (edge_min_entropy < node_min_entropy ) // use edge arr to sample
            // cout << "edge_min_entropy: " << edge_min_entropy <<endl;
            int ref_node_num;

            // find what idex is occupied by already sampled node
            if (mst_edge_lst[min_entropy_edge_num].status == 1) { // node_a is already sampled
                ref_node_num = mst_edge_lst[min_entropy_edge_num].node_a;
                sample_node_num = mst_edge_lst[min_entropy_edge_num].node_b;
            }
            else { // mst_edge_lst[min_entropy_edge_num].status == 2, node_b is already sampled
                ref_node_num = mst_edge_lst[min_entropy_edge_num].node_b;
                sample_node_num = mst_edge_lst[min_entropy_edge_num].node_a;
            }

            // find ref_node_num index by "already_sampled_index_arr"
            int ref_idx = mst_edge_lst[min_entropy_edge_num].ref_node_idx;

            // assign sample_arr value (ref_node_idx)
            for (int i = 0; i < m_problem_size; i ++) {

                int tmp_idx = ref_idx + i;

                if (tmp_idx >= m_problem_size) {
                    tmp_idx -= m_problem_size;
                }

                if (is_sampled_index[tmp_idx] == false) { // that index is not sampled yet
                    sample_arr[tmp_idx] = m_edge_matrix[ref_node_num][sample_node_num][i];
                }
                else  {// that index is already sampled
                    sample_arr[tmp_idx] = 0.0;
                }
            }

            // cout << "use edge arr to sample (assign sample arr): " << start - end << endl;


            end = clock();
            ES += start - end;
            start = clock();
        }



        // ===== sample from array           (  time complexity: O(n)  )
        // PrintArray(sample_arr, m_problem_size);
        int sample_idx = sample_from_array(sample_arr, m_problem_size);


        end = clock();
        sample += start - end;
        // cout << "sample: " << start - end << endl;
        start = clock();




        // ===== assign gene value   
        genes[sample_idx] = sample_node_num;
        // cout << "genes[" << sample_idx <<"] = "<< sample_node_num << ", genes[" << sample_idx <<"] = "<< sample_node_num << ", genes[" << sample_idx <<"] = "<< sample_node_num << endl;
        // cout << endl;
            

        // ===== update information
        // already_sampled_index_arr[m_problem_size]; // store aleady sampled index
        is_sampled_node[sample_node_num] = true;
        is_sampled_index[sample_idx] = true;







        // ===== update all [nodes] information (entropy_ratio, sum, ...)
        //      time complexity: (n nodes) * O(1) ==> O(n)

        for (int i = 0; i < m_problem_size; i ++) {
            // if that node is not sampled yet
            if (is_sampled_node[i] == false) {
                // update entropy
                mst_node_lst[i].entropy = update_entropy(mst_node_lst[i].entropy, m_node_matrix[i][sample_idx], mst_node_lst[i].element_sum);

                // update sum
                mst_node_lst[i].element_sum -= m_node_matrix[i][sample_idx];

            }
        }

        end = clock();
        NU += start - end;
        // cout << "update node entropy: " << start - end << endl;
        start = clock();

        // update all [edges] usabilty (status, entropy_ratio, sum, ... )
        for (int edge_num = 0; edge_num < m_problem_size - 1; edge_num ++) {

            // (status 0 -> 0)
                // do not need to do anything


            // sample node is one of the node in the edge
            if (mst_edge_lst[edge_num].node_a == sample_node_num || mst_edge_lst[edge_num].node_b == sample_node_num ) {

                // (status 0 -> 1) or (status 0 -> 2)
                if (mst_edge_lst[edge_num].status == 0) {
                    // recalculate entropy_ratio, sum (  time complexity: O(n) ?? , amortized O(1) )
                    // and assign ref_node_idx
                    
                    double tmp_arr[m_problem_size];
                    double tmp_sum = 0;

                    if (mst_edge_lst[edge_num].node_a == sample_node_num) {
                        mst_edge_lst[edge_num].status = 1;
                        
                        for (int i = 0; i < m_problem_size; i ++) {

                            int tmp_idx = sample_idx + i;

                            if (tmp_idx >= m_problem_size) {
                                tmp_idx -= m_problem_size;
                            }

                            if (is_sampled_index[tmp_idx] == false) { // that index is not sampled yet
                                tmp_arr[tmp_idx] = m_edge_matrix[sample_node_num][mst_edge_lst[edge_num].node_b][i];
                                tmp_sum += m_edge_matrix[sample_node_num][mst_edge_lst[edge_num].node_b][i];
                            }
                            else  {// that index is already sampled
                                tmp_arr[tmp_idx] = 0.0;
                            }
                        }


                        mst_edge_lst[edge_num].entropy = calculate_entropy(tmp_arr, m_problem_size);
                        mst_edge_lst[edge_num].element_sum = tmp_sum;
                        
                        // cout << "1 tmp_arr: ";
                        // PrintArray(tmp_arr, m_problem_size);
                        // cout << "entropy: " << mst_edge_lst[edge_num].entropy << endl << endl;
                    }
                    else { // mst_edge_lst[edge_num].node_b == sample_node_num
                        mst_edge_lst[edge_num].status = 2;

                        for (int i = 0; i < m_problem_size; i ++) {

                            int tmp_idx = sample_idx + i;

                            if (tmp_idx >= m_problem_size) {
                                tmp_idx -= m_problem_size;
                            }

                            if (is_sampled_index[tmp_idx] == false) { // that index is not sampled yet
                                tmp_arr[tmp_idx] = m_edge_matrix[sample_node_num][mst_edge_lst[edge_num].node_a][i];
                                tmp_sum += m_edge_matrix[sample_node_num][mst_edge_lst[edge_num].node_a][i];
                            }
                            else  {// that index is already sampled
                                tmp_arr[tmp_idx] = 0.0;
                            }
                        }


                        mst_edge_lst[edge_num].entropy = calculate_entropy(tmp_arr, m_problem_size);
                        mst_edge_lst[edge_num].element_sum = tmp_sum;
                        // cout << "2 tmp_arr: ";
                        // PrintArray(tmp_arr, m_problem_size);
                        // cout << "entropy: " << mst_edge_lst[edge_num].entropy << endl << endl;
                    }
                    mst_edge_lst[edge_num].ref_node_idx = sample_idx;
                }

                // (status 1 -> 3) or (status 2 -> 3)  (  time complexity: O(1)  )
                    // no entropy_ratio business
                    // discard array
                else if (mst_edge_lst[edge_num].status == 1 || mst_edge_lst[edge_num].status == 2) {
                    mst_edge_lst[edge_num].status = 3;
                }
            }

            // not the node in that edge
            else if (mst_edge_lst[edge_num].status == 1) {
                // (status 1 -> 1) or (status 2 -> 2)
                    // update entropy_ratio, sum (  time complexity: O(1) ??  )
                    // need array to determine which element should be deleted (find ref node)
                int tmp_idx = sample_idx - mst_edge_lst[edge_num].ref_node_idx;
                if (tmp_idx < 0) {
                    tmp_idx += m_problem_size;
                }

                // cout << "ref_node: "<<  mst_edge_lst[edge_num].node_a << endl;
                // cout << "tmp_idx: "<< tmp_idx << endl;
                // cout << "sample_idx: "<< sample_idx << endl;
                // cout << "mst_edge_lst[edge_num].ref_node_idx: "<< mst_edge_lst[edge_num].ref_node_idx << endl;
                // cout << "original_entropy: "<< mst_edge_lst[edge_num].entropy << endl;

                double tmp_del_element = m_edge_matrix[mst_edge_lst[edge_num].node_a][mst_edge_lst[edge_num].node_b][tmp_idx];
                mst_edge_lst[edge_num].entropy = update_entropy(mst_edge_lst[edge_num].entropy, tmp_del_element, mst_edge_lst[edge_num].element_sum);
                mst_edge_lst[edge_num].element_sum -= tmp_del_element;
                // cout << "update_entropy: "<< mst_edge_lst[edge_num].entropy << endl;
                // cout << "tmp_del_element: "<< tmp_del_element << endl;
                // cout  << endl;


            }

            // not the node in that edge
            else if (mst_edge_lst[edge_num].status == 2) {
                // (status 1 -> 1) or (status 2 -> 2)
                    // update entropy_ratio, sum (  time complexity: O(1) ??  )
                    // need array to determine which element should be deleted (find ref node)
                int tmp_idx = sample_idx - mst_edge_lst[edge_num].ref_node_idx;
                if (tmp_idx < 0) {
                    tmp_idx += m_problem_size;
                }

                // cout << "ref_node: "<<  mst_edge_lst[edge_num].node_b << endl;
                // cout << "tmp_idx: "<< tmp_idx << endl;
                // cout << "sample_idx: "<< sample_idx << endl;
                // cout << "mst_edge_lst[edge_num].ref_node_idx: "<< mst_edge_lst[edge_num].ref_node_idx << endl;
                // cout << "original_entropy: "<< mst_edge_lst[edge_num].entropy << endl;

                double tmp_del_element = m_edge_matrix[mst_edge_lst[edge_num].node_b][mst_edge_lst[edge_num].node_a][tmp_idx];
                mst_edge_lst[edge_num].entropy = update_entropy(mst_edge_lst[edge_num].entropy, tmp_del_element, mst_edge_lst[edge_num].element_sum);
                mst_edge_lst[edge_num].element_sum -= tmp_del_element;

                // cout << "update_entropy: "<< mst_edge_lst[edge_num].entropy << endl;
                // cout << "tmp_del_element: "<< tmp_del_element << endl;
                // cout  << endl;



            }
        
        }

        end = clock();
        EU += start - end;
        // cout << "update edge entropy: " << start - end << endl<< endl;


        // cout << endl;
    }
    loop_end = clock();


    // time_t NC = 0, NS = 0, NU = 0, EC = 0, ES = 0, EU = 0, sample = 0;
    cout << "NC: " << NC << endl;
    cout << "EC: " << EC << endl;
    cout << "ES: " << ES << endl;
    cout << "NS: " << NS << endl;
    cout << "NU: " << NU << endl;
    cout << "EU: " << EU << endl;
    cout << "sample: " << sample << endl;
    cout << "loop time: " << loop_start - loop_end << endl;

    cout << "loop_time - (NC + NS + NU + EC + ES + EU + sample): " << loop_start - loop_end - (NC + NS + NU + EC + ES + EU + sample) <<  endl << endl;


}