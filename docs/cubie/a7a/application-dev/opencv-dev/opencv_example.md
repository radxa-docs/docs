---
sidebar_position: 3
---

# OpenCV 示例

主要介绍 OpenCV 图片的预览、摄像头调用以及视觉玩法示例。

## 图像预览

### 图片预览

读取本地图片并显示：您需要新建 `preview_image.py` 文件，将 `preview_image.py` 的代码复制到 Cubie A7A 上运行。

<details>
<summary>preview_image.py</summary>
```
#!/usr/bin/env python3
# -*- encoding: utf-8 -*-

import cv2

# Read the image

image = cv2.imread('your_image.jpg') # Replace with your image path

# Check if the image is loaded successfully

if image is None:
print("Failed to load image. Please check the file path.")
else: # Display the image in a window
cv2.imshow('Preview', image) # Wait for the user to press any key
cv2.waitKey(0) # Close the window
cv2.destroyAllWindows()

```
</details>
### 实时预览
读取摄像头画面并显示：您需要新建 `preview_camera.py` 文件，将 `preview_camera.py` 的代码复制到 Cubie A7A 上运行。

<details>
<summary>preview_camera.py</summary>
```

#!/usr/bin/env python3

# -_- encoding: utf-8 -_-

import cv2

# Open the camera

video_capture = cv2.VideoCapture(0)

while True: # Read a frame from the camera
ret, frame = video_capture.read()

    # Check if the frame is read successfully
    if not ret:
        print("Failed to read frame. Please check the camera connection.")
        break

    # Display the frame in a window
    cv2.imshow('Preview', frame)

    # Wait for the user to press 'q' to quit
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release the camera and close the window

video_capture.release()
cv2.destroyAllWindows()

```
</details>

## Harris 角点检测

Harris 角点检测（Harris Corner Detection）是一种经典的图像特征点检测算法，用于检测图像中的角点。

### 图片识别

<details>
<summary>harris_image.py</summary>
```

#!/usr/bin/env python3

# -_- encoding: utf-8 -_-

import cv2
import numpy as np

# Read image

img = cv2.imread('./pic1.png')
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Harris corner detection

gray = np.float32(gray)
dst = cv2.cornerHarris(gray, 2, 3, 0.08)
dst = cv2.dilate(dst, None)
img[dst > 0.01 * dst.max()] = [0, 0, 255]

# Display image

cv2.imshow('Harris Corner Detection', img)
cv2.waitKey(0)
cv2.destroyAllWindows()

```
</details>

### 实时检测

<details>
<summary>harris_camera.py</summary>
```

#!/usr/bin/env python3

# -_- encoding: utf-8 -_-

import cv2
import numpy as np

# Open the camera

video_capture = cv2.VideoCapture(0)

while True: # Read a frame from the camera
ret, frame = video_capture.read()

    # Check if the frame is read successfully
    if not ret:
        print("Failed to read frame. Please check the camera connection.")
        break

    # Convert to greyscale
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Using Harris corner detection

dst = cv2.cornerHarris(gray, 2, 3, 0.08)
dst = cv2.dilate(dst, None)
frame[dst > 0.01 * dst.max()] = [0, 0, 255]

# Display image

cv2.imshow('Harris Corner Detection', frame)
cv2.waitKey(1)

# Release the camera and close the window

video_capture.release()
cv2.destroyAllWindows()

```
</details>

## Shi-Tomasi 角点检测

Shi-Tomasi 角点检测（Shi-Tomasi Corner Detection）是 Harris 角点检测的改进算法，用于检测图像中的角点。

### 图片识别
<details>
<summary>shi_tomasi_image.py</summary>
```

import cv2
import numpy as np

# Read the image

img = cv2.imread('./pic1.png')

# Convert to greyscale

gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Using Shi-Tomasi corner detection

corners = cv2.goodFeaturesToTrack(gray, maxCorners=100, qualityLevel=0.01, minDistance=10, blockSize=3)

# If a corner point is detected, it is converted to integer format and plotted

if corners is not None:
corners = np.int0(corners)
for corner in corners:
x, y = corner.ravel()
cv2.circle(img, (x, y), 3, 255, -1)

# Display image

cv2.imshow('Shi-Tomasi Corner Detection', img)
cv2.waitKey(0)
cv2.destroyAllWindows()

```
</details>

### 实时检测

<details>
<summary>shi_tomasi_camera.py</summary>
```

#!/usr/bin/env python3

# -_- encoding: utf-8 -_-

import cv2
import numpy as np

# Open the camera

video_capture = cv2.VideoCapture(0)

while True: # Read a frame from the camera
ret, frame = video_capture.read()

    # Check if the frame is read successfully
    if not ret:
        print("Failed to read frame. Please check the camera connection.")
        break

    # Convert to greyscale
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Using Shi-Tomasi corner detection

corners = cv2.goodFeaturesToTrack(gray, maxCorners=100, qualityLevel=0.01, minDistance=10, blockSize=3)

# If a corner point is detected, it is converted to integer format and plotted

if corners is not None:
corners = np.int0(corners)
for corner in corners:
x, y = corner.ravel()
cv2.circle(frame, (x, y), 3, 255, -1)

# Display image

cv2.imshow('Shi-Tomasi Corner Detection', frame)
cv2.waitKey(1)

# Release the camera and close the window

video_capture.release()
cv2.destroyAllWindows()

```
</details>

## ORB 特征检测

### 图片识别

<details>
<summary>orb_image.py</summary>
```

import cv2
import numpy as np

# Read the image

img = cv2.imread('pic1.png')
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Create ORB objects

orb = cv2.ORB_create()

# Detect keypoints and compute descriptors

kp, des = orb.detectAndCompute(gray, None)

# Mapping key points

img = cv2.drawKeypoints(gray, kp, img, color=(0,255,0), flags=0)

# Display image

cv2.imshow('ORB', img)
cv2.waitKey(0)
cv2.destroyAllWindows()

```
</details>

### 实时检测

<details>
<summary>orb_camera.py</summary>
```

#!/usr/bin/env python3

# -_- encoding: utf-8 -_-

import cv2
import numpy as np

# Open the camera

video_capture = cv2.VideoCapture(0)

while True: # Read a frame from the camera
ret, frame = video_capture.read()

    # Check if the frame is read successfully
    if not ret:
        print("Failed to read frame. Please check the camera connection.")
        break

    # Convert to greyscale
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Create ORB objects
    orb = cv2.ORB_create()

    # Detect keypoints and compute descriptors
    kp, des = orb.detectAndCompute(gray, None)

    # Mapping key points
    frame = cv2.drawKeypoints(gray, kp, frame, color=(0,255,0), flags=0)

    # Display image
    cv2.imshow('ORB', frame)
    cv2.waitKey(1)

# Release the camera and close the window

video_capture.release()
cv2.destroyAllWindows()

```
</details>

## 人脸识别

### 图片识别

<details>
<summary>face_recognition_image.py</summary>
```

import cv2

# Load pre-trained Haar feature classifier for face detection

face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

# Read the image of the face to be detected

image_path = 'face-synthesis-online01.png'
image = cv2.imread(image_path)

# Convert to greyscale

gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

# Detect faces in images using cascade classifiers

faces = face_cascade.detectMultiScale(gray, 1.3, 5)

# Draw a rectangle around each detected face

for (x, y, w, h) in faces:
cv2.rectangle(image, (x, y), (x+w, y+h), (255, 0, 0), 2)

# Display image

cv2.imshow('Face Detection', image)

while True:
if cv2.waitKey(100)==27:
cv2.destroyAllWindows()

```
</details>

### 实时检测

<details>
<summary>face_recognition_camera.py</summary>
```

#!/usr/bin/env python3

# -_- encoding: utf-8 -_-

import cv2

# Load pre-trained Haar feature classifier for face detection

face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

# Open the camera

video_capture = cv2.VideoCapture(0)

while True: # Read a frame from the camera
ret, frame = video_capture.read()

    # Check if the frame is read successfully
    if not ret:
        print("Failed to read frame. Please check the camera connection.")
        break

    # Convert to greyscale
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Detect faces in images using cascade classifiers
    faces = face_cascade.detectMultiScale(gray, 1.3, 5)

    # Draw a rectangle around each detected face
    for (x, y, w, h) in faces:
        cv2.rectangle(frame, (x, y), (x+w, y+h), (255, 0, 0), 2)

    # Display image
    cv2.imshow('Face Detection', frame)
    cv2.waitKey(1)

# Release the camera and close the window

video_capture.release()
cv2.destroyAllWindows()

```
</details>

```
