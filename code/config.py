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
    bpc_feature_path: str = "./data/EC_feature.json"
    bpc_output_path: str = './data/EC_labels_rav.csv'  # paths with labels

    #bpc_path: str = "./data/RAV_path.csv"  # paths
    #bpc_feature_path: str = "./data/RAV_feature.json"
    



    #susas_path: str = "./data/susas_path.csv"
    #susas_feature_path: str = "./data/susas_feature.json"
    susas_path: str = "./data/RAV_path.csv"
    susas_feature_path: str = "./data/RAV_feature.json"
    train_test_split = 1
    
    # Label
    label_map: dict = {
        ## for BPC
        #"HighPositive": 1, # medium
        #"LowPositive": 0, # neutral
        #"HighNegative": 2 # high

        ## for SUSAS
        "HighPositive": 1, # medium
        "LowPositive": 1, # neutral
        "HighNegative": 0, # high     

        ## for RAV
        "NeutralE":0,
        "CalmE":1,
        "HappyE":2,
        "SadE":3,
        "AngryE":4,
        "FearfulE":5,
        "DisgustE":6,
        "SurprisedE":7   
    }
    label_size = 8
        
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
