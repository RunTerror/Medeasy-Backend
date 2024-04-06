from model.data_preprocessing import load_raw_data
import numpy as np
from model.resnet import Resnet

def analyze_ECG(file):
    ecg_data = load_raw_data(file[0].name, 100, "")
    X = np.expand_dims(ecg_data, axis=0)
    output_dir = "time_series/model"
    resnet_model = Resnet(output_dir, input_shape=[1000, 12], n_classes=52)
    prediction, _ = resnet_model.predict(X)
    prediction = prediction[0]
    masked_arr = (prediction > 0.5).astype(int)
    result_list = [labels[i] for i in range(len(masked_arr)) if masked_arr[i] == 1]
    if text_input:
        query = "I have been diagnosed with {} in my Heart ECG. {}?".format(
            " ".join(result_list), text_input
        )