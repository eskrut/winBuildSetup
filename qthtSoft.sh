#!/bin/bash

. rc

base=${BASE_DISK}

export PATH=\
${base}/build/htData:\
${base}/build/htDatad:\
${base}/build/libfem:\
${base}/local/doli/lib:\
${base}/local/qwt/lib:\
${base}/local/fann/bin:\
${base}/local/fann/lib:\
$PATH

export PATH=${base}/local/vtkd/bin:${base}/local/vtk/bin:$PATH


qtcreator &
