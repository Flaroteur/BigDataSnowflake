import pandas as pd
import glob
import os

file_pattern = "./src/MOCK_DATA_*.csv"

files = glob.glob(file_pattern)

for file_path in files:
    base_name = os.path.basename(file_path)
    i = int(base_name.split("_")[2].split(".")[0])
    
    df = pd.read_csv(file_path)
    df['id'] = df['id'] + (i * 1000)
    
    df.to_csv(file_path, index=False)
