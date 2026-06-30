# Virtual Reality Hypnosis EEG Analysis

This repository contains the analysis code developed for a CYBER Master practicum project on virtual reality hypnosis (VRH), clinical hypnosis, EEG features, machine learning, and SHAP-based interpretability.

The project investigated whether VRH produced subjective hypnotic experiences comparable to clinical hypnosis and explored whether EEG-derived features could distinguish the two conditions. The analysis used behavioural measures, spectral power, functional connectivity based on dWPLI, machine learning classification, and SHAP explanations.

## Project Overview

The study compared three experimental conditions:

* REST: eyes-open resting state
* HYP: clinical hypnosis
* VRH: virtual reality hypnosis

The analysis focused on:

* Visual analogue scale (VAS) ratings of absorption, dissociation, and automaticity
* EEG relative band power across delta, theta, alpha, beta, and gamma bands
* Whole-brain functional connectivity using dWPLI
* Machine learning classification of HYP versus VRH
* SHAP-based interpretation of EEG feature importance

## Repository Structure

```text
.
├── README.md
├── eeg_scripts/
│   ├── preprocessing/
│   ├── feature_extraction/
│   └── connectivity/
├── ml_scripts/
│   ├── classification/
│   └── shap_analysis/
├── figures/
│   ├── eeg_outputs/
│   ├── machine_learning/
│   └── shap_outputs/
├── docs/
│   └── supplementary_notes/
└── requirements.txt
```

## Main Analysis Components

### EEG Preprocessing

The EEG preprocessing workflow included signal inspection, filtering, bad-channel review, artifact correction, rereferencing, and segmentation into analysis-ready epochs.

### Spectral Power Analysis

Relative spectral power was computed across five EEG frequency bands:

* Delta
* Theta
* Alpha
* Beta
* Gamma

These features were used for statistical comparison across conditions and for machine learning classification.

### Functional Connectivity Analysis

Functional connectivity was estimated using the debiased weighted phase lag index (dWPLI). Connectivity features represented pairwise relationships between EEG channels within each frequency band.

### Machine Learning

Machine learning models were used exploratorily to distinguish clinical hypnosis from VRH using EEG-derived features. Leave-One-Subject-Out Cross-Validation was used to reduce subject leakage.

### SHAP Interpretability

SHAP analysis was used to interpret model predictions and identify which EEG bands and regions contributed most strongly to classification decisions.

## Data Availability and GDPR Statement

The EEG and behavioural dataset used in this project is not included in this repository. The data contain human-subject research information and are protected under the General Data Protection Regulation (GDPR) and institutional data-management requirements.

Raw EEG data, processed participant-level data, condition-level feature tables, and any confidential institutional files are therefore excluded from GitHub.

Access to the dataset may be requested from Dr. Audrey Vanhaudenhuyse, subject to ethical approval, institutional authorization, and applicable data-sharing agreements.

## Reproducibility Notes

This repository is intended to document the analytical workflow and code structure used in the practicum project. Some scripts may require institutional data files that are not publicly available. Therefore, the repository supports methodological transparency but does not provide a fully runnable public dataset.

## Author

Maksuda Haider Sayma
CYBER Master Practicum Project

## Supervisor

Dr. Audrey Vanhaudenhuyse

## Status

Practicum research project.
Code and documentation are provided for academic and reproducibility purposes only.
