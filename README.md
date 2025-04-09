# YOLOv8 Human Labeling in MATLAB using Ground Truth Labeler

This guide explains how to integrate a pretrained YOLOv8 model with MATLAB's Ground Truth Labeler App to automatically generate human bounding box annotations and manually assign IDs using attributes.

---

## Requirements

- MATLAB R2023b or later
- Toolboxes:
  - Computer Vision Toolbox
  - Deep Learning Toolbox
  - Deep Learning Toolbox Converter for ONNX Model Format

---

## Steps to use YOLOv8 with Ground Truth Labeler in MATLAB

### 1. Download the repository

Download the YOLOv8 model integration from:
> 🔗 https://github.com/matlab-deep-learning/Pretrained-YOLOv8-Network-For-Object-Detection.git

---

### 2. Add the folder to MATLAB path

In MATLAB, navigate to the downloaded folder in the **Current Folder** pane and run:

```matlab
addpath(genpath(pwd));
```

---

### 3. Install required toolboxes

Go to the **Home** tab → click **Add-Ons** → **Get Add-Ons**.
In the Add-On Explorer, search for and install the following:

- Computer Vision Toolbox
- Deep Learning Toolbox
- Deep Learning Toolbox Converter for ONNX Model Format

---

### 4. Prepare your files

- Place the custom automation file `yolov8_label.m` in the same folder.
- Add your `.png` image folder (e.g., `output_images`) and the file `load_timestamps.m` (from this repo: https://github.com/Cyano0/Label-the-AoC-Rosbag-Data/tree/main) into the same directory.
- Run the following command in MATLAB:

```matlab
load_timestamps;
```

---

### 5. Open the Ground Truth Labeler App

In the MATLAB Command Window, run:

```matlab
groundTruthLabeler
```

---

### 6. Load your images

- Load the folder containing your `.png` frames (e.g., `output_images`).

---

### 7. Create a label

- Add a new **rectangle ROI** label named **"human"**.

---

### 8. Import the custom algorithm

- Go to **Select Algorithm** → click **Import Algorithm** → choose `yolov8_label.m`.

---

### 9. Select the custom algorithm

- Choose **"YOLOv8 Human Labeler"** from the automation list.

---

### 10. Run the automation

- Click **Automate** → then click **Run**. YOLOv8 will automatically draw bounding boxes for detected humans.

---

### 11. Accept the results

- Once satisfied, click **Accept** to keep the generated labels.

---

### 12. Add an ID attribute

- Click the **checkbox** next to the label **"human"** in the label list.
- Click **Attribute** → Add a new attribute called **ID**.
- Set the **Type** to **"List"** and provide values like `1, 2, 3, ...`.

---

### 13. Assign IDs to detections

For each frame:
- Click on each bounding box.
- In the right panel, assign the correct **ID** (e.g., `1` for person1, `2` for person2, etc.).

---


