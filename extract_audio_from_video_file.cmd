:: Name:     extract_audio_from_video_file.cmd
:: Purpose:  a simple batch that extracts the audio from a given video file and saves it as a .wav file
::			 Also works for folders containing multiple video files.
:: Author:   iorga.ton@gmail.com
:: Revision: 17th March 2020 - initial version
::           (Quarantine Code)

@ECHO OFF
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

set input_path=%1

IF EXIST %input_path%\* (

	CD /D %input_path% 

	FOR %%i in (*.*) do (

		set folder_file=%%i
		set folder_file_root=%%~ni

		ffmpeg -i "!folder_file!" -vn -acodec pcm_s16le "!folder_file_root!_ExtractedAudio.wav"
	)
) else (

	set input_file=%~nx1
	set input_file_root=%~n1 
	set input_file_folder=%~dp1

	CD /D %input_file_folder%

	ffmpeg -i "!input_file!" -vn -acodec pcm_s16le "!input_file_root!_ExtractedAudio.wav"
	
)

ECHO ON

EXIT /B 0