# ParseAndRunDxlFile.py - Parse and run passed DXL script file

import os
import sys
import win32com.client
import win32api

dxl_file_spec = ' '.join(sys.argv[1:]).replace('\\', '/')

doors = win32com.client.Dispatch('Doors.Application')

doors.runStr('oleSetResult getenv "DOORSLOGFILE"')
doors_log_spec = doors.result

doors.runStr('oleSetResult checkDXLFile "' + dxl_file_spec + '"')
doors_result = doors.result
if len(doors_result) == 0:
   doors_log_old_size = os.stat(doors_log_spec).st_size
   doors.runFile(dxl_file_spec)
   win32api.Sleep(500,0)
   doors_log_new_size = os.stat(doors_log_spec).st_size
   if doors_log_new_size > doors_log_old_size:
      doors_log = open(doors_log_spec, 'r')
      doors_log.seek(doors_log_old_size, 0)
      doors_result = doors_log.read()
      doors_log.close()
print(doors_result)
