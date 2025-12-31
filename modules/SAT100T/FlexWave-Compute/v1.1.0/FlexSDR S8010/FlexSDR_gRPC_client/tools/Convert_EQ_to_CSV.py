from scipy.io import loadmat
import numpy as np
import os
import sys
import csv

script_dir = os.path.dirname(__file__)
parent_dir = os.path.abspath(os.path.join(script_dir, '..'))
os.chdir(parent_dir)

'''
data = loadmat('output.mat')
print(data.keys())
coeffs = data['geqTDquant'][0]
print(np.real(coeffs))
for coeff in coeffs:
    print(f"Re: {np.real(coeff)}, Im: {np.imag(coeff)}")
'''


data = loadmat('mat_files/eq_files/eq_filt.mat')
output_csv = "mat_files/eq_files/eq_filt.csv"

coefficients = data["geqTDquant"][0]

with open(output_csv, "w", newline='') as csvfile:
    csv_writer = csv.writer(csvfile)
    for coeff in coefficients:
        coeff_real = np.real(coeff)
        coeff_imag = np.imag(coeff)
        csv_writer.writerow([coeff_real, coeff_imag])