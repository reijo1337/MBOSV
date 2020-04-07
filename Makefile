l2:
	spin -a lab2.pml
	cc -DSAFETY -o .bin/lab2 pan.c
	rm pan.*
	.bin/lab2
	spin -t -p lab2.pml
	rm lab2.pml.trail