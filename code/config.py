from doctest import FAIL_FAST


class Argument:
    
    # Setup
    cuda: bool = True
    save_path: str = '/home/xuranzeng/thesis_git/code/EC_model2.pth'
    load_path: str = '/home/xuranzeng/thesis_git/code/EC_model2.pth'
    load_pretrained: bool = False
    train: bool = True
    evaluate: bool = False
    predict: bool = True
        
    # Feature
    delta_for_teo: int = 0.2
    
    # Dataset
    bpc_path: str = "./data/EC_path.csv"  # paths
    bpc_output_path: str = './data/EC_labels2.csv'  # paths with labels
    # bpc_output_path: str = './data/sample_EC2_labels.csv'  # paths with labels
    bpc_feature_path: str = "./data/EC_feature.json"
    # bpc_feature_path: str = "./data/sample_EC_feature.json"



    susas_path: str = "./data/susas_path.csv"
    susas_feature_path: str = "./data/susas_feature.json"
    train_test_split = 1
    
    # Label
    label_map: dict = {
        #"HighPositive": 1, # medium
        #"LowPositive": 0, # neutral
        #"HighNegative": 2 # high
        "HighPositive": 1, # medium
        "LowPositive": 1, # neutral
        "HighNegative": 0 # high        
    }
    label_size = 3
        
    # Training
    batch_size: int = 16
    learning_rate: float = 0.001
    weight_decay: float = 0.01
    epoch_num: int = 5
    num_workers: int = 0
    gradient_accumulate_step: int = 1
    
    # Model
    teo_feature_size: int = 1
    gemaps_feature_size: int = 25
    adapt_layer_size: int = 20
    weight_mmd: float = 1
