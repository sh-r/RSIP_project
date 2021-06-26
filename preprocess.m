function preprocess()

	notokFiles=["manhole1.png","manhole2.png", "manhole5.png", ...
		 "manhole6.png", "manhole8.png","manhole9.png", "manhole10.png", ...
		 "manhole14.png", "manhole15.png", "manhole16.png", "manhole21.png", ...
         "manhole22.png", "manhole23.png", "manhole24.png", "manhole25.png", ...
         "manholeF.png", "manholeG.png", "manholeH.png", "manholeI.png", ...
         "manholeJ.png"];

	okFiles = ["manhole3.png", "manhole4.png", "manhole7.png", ...	
			"manhole11.png", "manhole12.png", "manhole13.png", ...
            "manhole17.png", "manhole18.png", "manhole19.png", ...
            "manhole20.png", "manhole26.png", "manhole27.png", "manhole28.png"...
            "manhole29.png", "manhole30.png","manholeA.png","manholeB.png", ...
            "manholeC.png", "manholeD.png", "manholeE.png"];

	srcDir='C:\Users\nitya\Desktop\nitya\data\';
	destDir='C:\Users\nitya\Desktop\nitya\processed\';

    for i=1:length(okFiles)
	    fileName=strcat('ok\',okFiles(i));
		srcFileName=strcat(srcDir,fileName);
		destFileName=strcat(destDir,fileName);
		processEllipse(srcFileName,destFileName);
	end
	
	for i=1:length(notokFiles)
		fileName=strcat('notok\',notokFiles(i));
		srcFileName=strcat(srcDir,fileName);
		destFileName=strcat(destDir,fileName);
		processEllipse(srcFileName,destFileName);
	end
	
end