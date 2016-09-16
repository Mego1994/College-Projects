% %FACE DETECTION:
% %Viola_Jones_img(imagesPath)

% %To detect Face
% faceDetector = vision.CascadeObjectDetector;
% %Returns Bounding Box values based on number of objects
% BB = step(faceDetector, Img);
% NOTE: A folder will be created in "pathName" having the output images.
%to show images: UNCOMMENT lines: 35, 40, 43, 47 

function Viola_Jones_img(imagesPath)
    %path to original (RGB) images to be face detected & cropped & resized & converted to gray scale.
    %imagesPath = 'C:\Users\Mego\Desktop\Face\';     
    files = dir(imagesPath);
    NF = length(files);
    
    fprintf('Starting ... Running');        %starting message
    
    for j = 3:NF
        image = imread(fullfile(imagesPath, files(j).name));    %reading images from directory
        checkImagesPath(imagesPath, j)
    end

    %function checks images path if "Face" or "facesnew"
    function checkImagesPath(imagesPath, j)
        if(strcmp(imagesPath, 'C:\Users\Mego\Desktop\testimages\'))
            %output folder to write cropped images in it.
            pathName = 'C:\Users\Mego\Desktop\TestDatabase\';
    
            %check existance of "Output" folder in the specified pathName
            if(~exist(pathName))
                mkdir(pathName);        %create folder "Output" if not found in pathName
            else
                fprintf('\n Output folder is already found! ... Running');
            end
    
        cropResizeImages(pathName, image, j-2);         %call cropResizeImages function
        
        else if(strcmp(imagesPath, 'C:\Users\Mego\Desktop\trainimages\'))
            %output folder to write cropped images in it.
            pathName = 'C:\Users\Mego\Desktop\TrainDatabase\';
    
            %check existance of "Output" folder in the specified pathName
            if(~exist(pathName))
                mkdir(pathName);        %create folder "Output" if not found in pathName
            else
                fprintf('\n Output folder is already found! ... Running');
            end
            outputImageName = sprintf('%d.jpg', j-2);     %output image has the same of the orignial image
            imwrite(image,[pathName, outputImageName]);     %write the output image to the pathName            
            
        else
            fprintf('\nCheck: your input folder must be with name: testimages or trainimages');      %failure message
        end  
    end   
end  %end of function checkImagesPath()

    %function detect faces, cropes faces from images, resizes and converts
    %to gray scale image
    function cropResizeImages(pathName, image, j)
        obj = image;
        %figure(1),imshow(obj);

        %detect face using vision.CascadeObjectDetector
        FaceDetect = vision.CascadeObjectDetector; 
        BB = step(FaceDetect,obj);
        %figure(2),imshow(obj);

        for i = 1:size(BB,1)
            %rectangle('Position',BB(i,:),'LineWidth',3,'LineStyle','-','EdgeColor','r');
            imgCropped = imcrop(obj,BB(i,:));   %crop image using with the detected face
            imgCroppedResized = imresize(imgCropped,[193 162]);     %rsize to new dimensions
            imgCroppedResizedGray = rgb2gray(imgCroppedResized);       %convert to gray scale
            %figure(3),subplot(2,2,i);imshow(imgCroppedResizedGray);
            
            %renaming images
            outputImageName = sprintf('%d.jpg', j);     %output image has the same of the orignial image
            imwrite(imgCroppedResizedGray,[pathName, outputImageName]);     %write the output image to the pathName
        end

        
    end

    fprintf('\nFinished ...');      %success message
end


