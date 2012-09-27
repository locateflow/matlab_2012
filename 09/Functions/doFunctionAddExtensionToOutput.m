function [varargout]= doFunctionAddExtensionToOutput(functionName, inputVar, nameExtension);

 eval([inputVar, nameExtension, ' = ', functionName, '(', inputVar, ')']);
