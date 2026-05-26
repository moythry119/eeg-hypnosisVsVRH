# Data

The EEG data used in this project is not publicly available
due to ethics restrictions (GIGA Consciousness Lab,
University of Liège).

## Expected structure

Place your .mat files in data/mat_files/ following this naming:
  VR_S2_EO1_mohawk.mat    — resting state, subject 2
  VR_S2_HYP_mohawk.mat    — hypnosis, subject 2
  VR_S2_VRH_mohawk.mat    — VR hypnosis, subject 2

## Expected .mat variables

Each file should contain:
  bpower  : (5, 127) — band power per band per channel
  matrix  : (5, 127, 127) — dwPLI connectivity matrix
  chanlocs: (1, 127) struct — channel location info