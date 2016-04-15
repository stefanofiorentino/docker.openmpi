set -x
export PYTHON_PATH=.
cd /home/tutorial/dispel4py



for f in `cat machines`; 
do ssh $f "rm -rf /home/tutorial/dispel4py/tc_cross_correlation/OUTPUT/DATA"
   ssh $f "rm -rf /home/tutorial/dispel4py/tc_cross_correlation/OUTPUT/XCORR"
   ssh $f "mkdir /home/tutorial/dispel4py/tc_cross_correlation/OUTPUT/DATA"
   ssh $f "mkdir /home/tutorial/dispel4py/tc_cross_correlation/OUTPUT/XCORR"
done

mpiexec -n 6 -hostfile machines python -m dispel4py.new.processor mpi tc_cross_correlation/realtime_prep.py -f tc_cross_correlation/realtime_xcorr_input.jsn 
