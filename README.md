# TDT4173 Group project
This repository contains the source code for Group 1's project in TDT4173 Machine Learning. The most vital files and folders are presented in this README.

## Setup
This project utilizes Python written in [Jupyter notebook](https://jupyter.org). The easiest way of running this code is by installing [Anaconda Navigator](https://docs.anaconda.com/anaconda/navigator/) and use that to run the Jupyter notebooks present in this repository.

## Files and directories of interest
### `Project.ipynb`
This file deals with training and evaluating classifiers. It does the following (in-order):
- Load and preprocess each data set
- Configure classifiers used and declare hyperparameters and corresponding values used in cross-validation
- Evaluate all classifiers on all data sets (or subset if training distributed)
- Upload results to Google Sheets (API-key is *not* included in this submission, for obvious reasons)

### `Analysis.ipynb`
This file concerns results and analyses utilized in the paper. It does the following:
- Load results from Google Sheets (if API-key is available), and writes the results to `data/results.csv`.
  - *Fallback*: If no API is available, it will read the results from `data/results.csv`
- Generates the tables and figures presented in the paper.
  
### `deploy/`
This folder contains scripts used to deploy the `Project.ipynb` to an arbitrary number of [Amazon Web Services](https://aws.amazon.com) instances. Check `deploy/README.md` for further information.

### `data/`
This directory contains the previously mentioned `results.csv`, as well as the following data sets:
- `abalone`
- `adult`
- `letter-recognition` (*currently unused*)
- `optdigits`
- `bank`
- `online_shoppers_intention`

The main project file most of the data sets from these files. The exception is `california_housing`, which will be downloaded when running the project. In addition, `online_shoppers_intention` and `bank` will be downloaded if needed, i.e. if not available within the data folder.
