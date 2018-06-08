# tensorflow-ObjectDetector-Dr
使用视网膜图片，自己标label，基于ssd模型训练自己的object detector

**注意**,配置protoc执行[pre.sh](https://github.com/yejg2017/tensorflow-ObjectDetector-Dr/tree/master/research/pre.sh)
```bash
./protoc_3.3/bin/protoc object_detection/protos/*.proto --python_out=. #一定要在object_detection的上一级目录!!!
```


到  https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/detection_model_zoo.md  
下载ssd_mobilenet_v1_coco模型

解压
```bash
tar -xf ssd_mobilenet_v1_coco*.tar.gz
```
## 准备工作
###  step 1
```
python xml_to_csv.py
```
生成csv文件,存放在[data](https://github.com/yejg2017/tensorflow-ObjectDetector-Dr/tree/master/research/object_detection/data) 目录中
[Drlabel](https://github.com/yejg2017/tensorflow-ObjectDetector-Dr/tree/master/research/object_detection/data/Drlabels.csv)


### step 2
```python
python generate_tfrecord.py --csv_input=data/Drlabels.csv --output_path=data/Drtrain.record
```
生成*.record文件  [record](https://github.com/yejg2017/tensorflow-ObjectDetector-Dr/research/object_detection/data/Drtrain.record)


### step 3
编辑 **Dr-object-detection.pbtxt**文件，
具体查看[pbtxt](https://github.com/yejg2017/tensorflow-ObjectDetector-Dr/tree/master/research/object_detection/data/Dr-object-detection.pbtxt)
```bash
vi Dr-object-detection.pbtxt
```

### step 4
到[download ssd_mobilenet_v1_coco.config](https://github.com/tensorflow/models/tree/master/research/object_detection/samples/configs)
下载 ** config ** 文件，修改[修改config](https://github.com/yejg2017/tensorflow-ObjectDetector-Dr/tree/master/research/object_detection/training/ssd_mobilenet_v1_coco.config)
```bash
vi ssd_mobilenet_v1_coco.config
```

### step 5
```bash
mkdir training
mv ssd_mobilenet_v1_coco.config  training/
```

### step 6
执行** train.ipynb **(奇怪的是，在jupyter notebook 上执行才不会报错,matplotlib的原因）

教程参考:  https://becominghuman.ai/tensorflow-object-detection-api-tutorial-training-and-evaluating-custom-object-detector-ed2594afcf73
