px4_airframes_folder=../ROMFS/px4fmu_common/init.d/airframes
px4_mavlink_folder=../src/modules/mavlink


### Edit the CMakeLists for the airframes
sed -i 's/4053_holybro_kopis2/4053_holybro_kopis2\n4054_holybro_kopis_cinewhoop_3\n4055_holybro_kopis_cinewhoop_3_mocap/g' ${px4_airframes_folder}/CMakeLists.txt

### Copy airframe files to the correct folder
cp ./4054_holybro_kopis_cinewhoop_3 ${px4_airframes_folder}
cp ./4055_holybro_kopis_cinewhoop_3_mocap ${px4_airframes_folder}

### Edit the mavlink file
sed -i 's/stream nothing'\
'/'\
'stream nothing\n'\
'configure_stream_local("TIMESYNC", 10.0f);\n'\
'configure_stream_local("LOCAL_POSITION_NED", 40.0f);\n'\
'configure_stream_local("ATTITUDE", 50.0f);\n\n'\
'configure_stream_local("ATTITUDE_TARGET", 2.0f);\n'\
'configure_stream_local("BATTERY_STATUS", 0.5f);\n'\
'configure_stream_local("ESTIMATOR_STATUS", 1.0f);\n'\
'configure_stream_local("EXTENDED_SYS_STATE", 1.0f);\n'\
'configure_stream_local("PING", 0.1f);\n'\
'configure_stream_local("POSITION_TARGET_LOCAL_NED", 1.5f);\n'\
'configure_stream_local("SYS_STATUS", 5.0f);/g' ${px4_mavlink_folder}/mavlink_main.cpp
