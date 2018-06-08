# step 1
## tar -xf ssd_mobilenet_v1_coco_2017_11_17.tar.gz
## python xml_to_csv.py

# step 2
## python generate_tfrecord.py --csv_input=data/Drlabels.csv --output_path=data/Drtrain.record

# step 3
## vi Dr-object-detection.pbtxt

# step 4
## vi ssd_mobilenet_v1_coco.config

# step 5
## mkdir training
## mv ssd_mobilenet_v1_coco.config  training/

# step 6
python train.py --logtostderr --train_dir=training/ --pipeline_config_path=training/ssd_mobilenet_v1_coco.config

