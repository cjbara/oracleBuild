cd create
echo "exit" | sqlplus guest/guest @create_all
cd ..
cd insert
./insert_all.sh
cd ..
cd packages
echo "exit" | sqlplus guest/guest @create_all
cd ..
