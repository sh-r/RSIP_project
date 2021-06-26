function testpreprocess()

	Files=["manholeA.png","manholeB.png", "manholeC.png", ...
		 "manholeD.png", "manholeE.png","manholeF.png", "manholeG.png", ...
		 "manholeH.png", "manholeI.png", "manholeJ.png"];

	srcDir='C:\Users\nitya\Desktop\nitya\test_data\';
	destDir='C:\Users\nitya\Desktop\nitya\test_processed\';

   	for i=1:length(Files)
		fileName=strcat(Files(i));
		srcFileName=strcat(srcDir,fileName);
		destFileName=strcat(destDir,fileName);
		processEllipse(srcFileName,destFileName);
	end
	
end