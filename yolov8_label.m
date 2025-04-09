classdef yolov8_label < vision.labeler.AutomationAlgorithm & vision.labeler.mixin.Temporal
    % Custom automation algorithm for Ground Truth Labeler using YOLOv8

    properties(Constant)
        Name = 'YOLOv8 Human Labeler';  
        Description = 'Detects people using YOLOv8.';  
        UserDirections = { ...  % Instructions shown in the App
            '1. Load image sequence.', ...
            '2. Create a rectangle label (e.g., "human").', ...
            '3. Go to Automate → Select "YOLOv8 Human Labeler" → Run.', ...
            '4. Review/edit labels and Accept.'};
    end

    properties
        detector  % YOLOv8 detector object
        labelName  % Name of label to assign (e.g., "human")
    end

    methods (Static)
        function isValid = checkSignalType(signalType)
            isValid = signalType == vision.labeler.loading.SignalType.Image;  % Only accept image signals
        end

        function supports = supportsMultisignalAutomation(~)
            supports = false;  % Single signal (not multisignal)
        end
    end

    methods
        function isValid = checkLabelDefinition(~, labelDef)
            isValid = labelDef.Type == labelType.Rectangle;  % Only accept rectangle ROI
        end

        function isReady = checkSetup(~, ~)
            isReady = true;  % Always ready to run
        end

        function initialize(obj, ~, labelsToAutomate)
            disp('Initializing YOLOv8 detector...');
            obj.detector = yolov8ObjectDetector('yolov8x');  % Load YOLOv8x model

            if isempty(labelsToAutomate) || height(labelsToAutomate) < 1
                warning('No label selected. Using default label "human".');
                obj.labelName = "human";  % Default label name
            else
                obj.labelName = string(labelsToAutomate.Name(1));  % Use selected label name
            end
        end

        function autoLabels = run(obj, I)
            [bboxes, ~, labels] = detect(obj.detector, I);  % Run YOLO on image

            isPerson = labels == "person";  % Filter only "person" detections
            bboxes = bboxes(isPerson, :);  % Keep person boxes

            autoLabels = table;  % Create empty label table
            autoLabels.Name = repmat({obj.labelName}, size(bboxes, 1), 1);  % Set label name
            autoLabels.Type = repmat(labelType.Rectangle, size(bboxes, 1), 1);  % Label type
            autoLabels.Position = mat2cell(bboxes, ones(size(bboxes, 1), 1), 4);  % Store bounding boxes
        end

        function terminate(obj)
            obj.detector = [];  % Clear detector
            obj.labelName = [];  % Clear label name
        end
    end

end
