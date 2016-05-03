set -x
export PYTHON_PATH=.

rm -rf /home/tutorial/dispel4py/tc_cross_correlation/OUTPUT/XCORR
mkdir /home/tutorial/dispel4py/tc_cross_correlation/OUTPUT/XCORR

OLD_PATH=`pwd`

cd /home/tutorial/dispel4py

for f in `cat /home/tutorial/machines`; 
do ssh $f "rm -rf /home/tutorial/dispel4py/tc_cross_correlation/OUTPUT/XCORR"
   ssh $f "mkdir /home/tutorial/dispel4py/tc_cross_correlation/OUTPUT/XCORR"
done

mpiexec -n 16 -hostfile /home/tutorial/machines python -m dispel4py.new.processor mpi tc_cross_correlation/xcorr_storm.py 
