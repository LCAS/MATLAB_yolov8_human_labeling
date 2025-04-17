# YOLOv8 Human Labeling in MATLAB using Ground Truth Labeler

This guide explains how to integrate a pretrained YOLOv8 model with MATLAB's Ground Truth Labeler App to automatically generate human bounding box annotations and manually assign IDs using attributes.

---

## Requirements

- MATLAB R2023b or later
- Toolboxes:
  - Computer Vision Toolbox
  - Deep Learning Toolbox
  - Deep Learning Toolbox **Converter for ONNX Model Format**

---

## Steps to use YOLOv8 with Ground Truth Labeler in MATLAB

### 1. Download the repository

Download the YOLOv8 model integration from here:
- can use git clone https://github.com/LCAS/MATLAB_yolov8_human_labeling.git
- Or just download as a zip.

---

### 2. Import the YOLO method

In MATLAB, following this [video](https://universityoflincoln-my.sharepoint.com/:v:/g/personal/zhuang_lincoln_ac_uk/EVvNP4r3_99Lp3phhGhX1ooBHJff1cgMyT2Dn_tcPwoidQ?e=WFU7d4&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D), import the YOLO method.

---

### 3. Start auto labelling

The same as the previous method.

---

### 4. Create a label

- Add a new **rectangle ROI** label named **"human"**.

---

### 5. Add an ID attribute

- Click the **checkbox** next to the label **"human"** in the label list.
- Click **Attribute** → Add a new attribute called **ID**.
- Set the **Type** to **"List"** and provide values like `1, 2, 3, ...`.

---
### 6. Import the custom algorithm

- Go to **Select Algorithm** → click **Import Algorithm** → choose `yolov8_label.m`.

---

### 7. Select the custom algorithm

- Choose **"YOLOv8 Human Labeler"** from the automation list.

---

### 8. Run the automation

- Click **Automate** → then click **Run**. YOLOv8 will automatically draw bounding boxes for detected humans.

---

### 9. Assign IDs to detections

For each frame:
- Click on each bounding box.
- In the right panel, assign the correct **ID** (e.g., `1` for person1, `2` for person2, etc.).

---

### 10. Accept the results

- Once satisfied, click **Accept** to keep the generated labels.

---
