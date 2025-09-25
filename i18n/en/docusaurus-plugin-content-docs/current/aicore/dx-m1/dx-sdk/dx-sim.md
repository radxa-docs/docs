---
sidebar_position: 3
---

# DX-SIM Inference Simulator

## Introduction

**DX-SIM (Model Simulator)** simulates DEEPX NPU hardware functionality on x86 PCs, enabling DXNN model inference simulation on x86-based computers.

## Installation

Please download the DX-SIM installation package from the DX-M1 SDK [Resource Download](../download.md) page and extract it:

<NewCodeBlock tip="X86 PC" type="PC">

```bash
mkdir dx_simulator
tar -xvf dx_simulator_v2.14.5.tar.gz -C dx_simulator && cd dx_simulator
```

</NewCodeBlock>

Install DX-SIM:

<NewCodeBlock tip="X86 PC" type="PC">

```bash
# install prerequisites
./scripts/install_prerequisites.sh

# install python
./scripts/install_python.sh

# install dx_simulator
pip3 install dx_simulator-2.14.5-cp311-cp311-linux_x86_64.whl --force-reinstall
```

</NewCodeBlock>

## Usage

### Simulator Class

- Use the `Simulator` class to initialize simulation variables:

```python
from dx_simulator import Simulator

simulator = Simulator(
    model_path="path/to/graph.dxnn",
    use_gpu=True, # If you want to run the model with gpu.
)
```

### Simulated Inference

For simulated inference, use the Simulator.run() function

- `output_names` is a list of model output names
- `input_feed` is a dictionary containing model input names and their corresponding data

```bash
outputs = simulator.run(
    output_names=["output1", "output2"],
    input_feed={"input": input_array},
)
```

### Generate Reference Data

If you want to generate reference data for comparison with NPU runtime outputs, please refer to the following method

```python
from dx_simulator import Simulator

image_path = "/path/to/image.png"
model_path = "/path/to/graph.dxnn"
save_dir = "/path/to/save_dir"

# Initialize simulator.
simulator = Simulator(
    model_path=model_path,
    mode="debug",
)

# Generate reference data.
simulator.make_gt_with_image_file(
    image_path=image_path,
    save_dir=save_dir,
)
```

### Image Preprocessing

When using the simulator for inference, the input data requirements are the same as the NPU, **requiring `uint8` type**. Please note the following points when performing preprocessing operations:

- The simulator's input data must be of `uint8` type
- Avoid using `Mul`, `Add` and other operations (multiplication, addition) in the preprocessing stage, as they may cause the data format to no longer meet the `uint8` requirement
- Operations like `Normalize` should be specified in the configuration file and processed by the **NPU side**
- After preprocessing, **you must convert the data type to `np.uint8`** to ensure the simulator can correctly accept the input

Here's an example of preprocessing code before using the simulator:

```python
import cv2
import numpy as np
from dx_simulator import Simulator

simulator = Simulator(model_path="graph.dxnn", mode="inference")
preprocess = simulator.get_preprocessing() # This can be easily used as image preprocessing module

input_image = cv2.imread("image.png")
preprocessed_image = preprocess(input_image) # Preprocess the image

# Important: Convert to uint8 before passing to simulator
outputs = simulator.run(
    output_names=["output1", "output2", "output3"],
    input_feed={"input": preprocessed_image.astype(np.uint8)}
)
```

### Simulator Class Member Functions

```python
from dx_simulator import Simulator
simulator = Simulator(model_path="graph.dxnn")
output = simulator.run(output_names, data) # Run NPU simulation
preprocess = simulator.get_preprocessing() # Return simulator's input preprocessing module
input_metadata = simulator.get_inputs() # Return model's input metadata
output_metadata = simulator.get_outputs() # Return model's output names
```

### Reference Code

For more DX-SIM usage examples, please refer to the sample code in the `example` directory of the DX-SIM SDK:

```bash
.
├── compiled_results
│   ├── mobilenetv2.dxnn
│   ├── yolov5face.dxnn
│   ├── yolov5pose.dxnn
│   └── yolov5s.dxnn
├── example_classification.py
├── example_generate_ref.py
├── example_yolov5face.py
├── example_yolov5pose.py
├── example_yolov5s.py
└── images
    ├── baseball.jpg
    └── gold_fish.jpg
```
