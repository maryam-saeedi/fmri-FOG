from brainsync import brainSync, normalizeData
import numpy as np
import pandas as pd
from nilearn import image

### for mean time course csv data
# sub_df = pd.read_csv('../data/0040.csv', header=None, na_filter=True, na_values=0, index_col=0)
# ref_df = pd.read_csv('../data/0408.csv', header=None, na_filter=True, index_col=0)
# sub = sub_df.values
# ref = ref_df.values

def get_cortical_map(file_path):
    img = image.load_img(file_path)
    img = np.array(img.dataobj).reshape((-1, 249))  # flat each volum in 249 time slot
    idx = np.where(img)
    matrix = img[np.unique(idx[0])]
    return matrix

ref = get_cortical_map('../data/nifti/0040.nii.gz')
sub = get_cortical_map('../data/nifti/0408.nii.gz')

sub, _, _ = normalizeData(sub) # Do the data normalization for subject brain
ref, _, _ = normalizeData(ref) # Do the data normalization for the reference brain

# subSynced is the synched data for the subject and
# O is the associated orthogonal transform
subSynced, O = brainSync(ref, sub)

print(subSynced)