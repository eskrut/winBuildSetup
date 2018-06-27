#!/bin/bash

base=/c/opt

export PATH=\
${base}/build/htData:\
${base}/build/libfem:\
${base}/local/doli/dope/DoPE:\
${base}/local/qwt/lib:\
${base}/local/fann/bin:\
$PATH

export PATH=${base}/local/vtkd/bin:$PATH

qtcreator &