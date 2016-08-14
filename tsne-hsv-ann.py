from skimage.io import imread
from skimage import color
from skimage.exposure import histogram
from PIL import Image
import os
import numpy as np
import pandas as pd



for year in range(1923,2015,1):
    DIR = "/data/damoncrockett/TIME/TIMEvault/"+year+"/"
    local_path = []
    for root,dirs,files in os.walk(DIR):
        for file in files:
            local_path.append(root+"/"+file)
            
    hist_vector = []
    for path in local_path:
        im = color.rgb2hsv(imread(path))
        h = histogram(im,nbins=8)[:,:,0])[0]
        s = histogram(im,nbins=8)[:,:,1])[0]
        v = histogram(im,nbins=8)[:,:,2])[0]
        
        
        vector = np.concatenate((h,s,v))
        hist_vector.append(vector)
        
    X = np.vstack(hist_vector)
    
    df = pd.DataFrame(X)
        