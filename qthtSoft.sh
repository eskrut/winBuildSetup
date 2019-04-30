#!/bin/bash

. rc

base=${BASE_DISK}

export PATH=\
${base}/build/htData:\
${base}/build/libfem:\
${base}/local/doli/lib:\
${base}/local/qwt/lib:\
${base}/local/fann/bin:\
$PATH

export PATH=${base}/local/vtkd/bin:$PATH

qtcreator &
