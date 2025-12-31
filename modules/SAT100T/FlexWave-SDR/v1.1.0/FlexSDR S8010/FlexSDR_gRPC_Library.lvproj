<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="24008000">
	<Property Name="NI.LV.All.SaveVersion" Type="Str">24.0</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="data" Type="Folder">
			<Item Name="FlexCompute C011T D83198.txt" Type="Document" URL="../FlexSDR_gRPC_client/data/FlexCompute C011T D83198.txt"/>
			<Item Name="FlexCompute C100T 909B13.txt" Type="Document" URL="../FlexSDR_gRPC_client/data/FlexCompute C100T 909B13.txt"/>
			<Item Name="FlexSDR S8010-01 9770BC.txt" Type="Document" URL="../FlexSDR_gRPC_client/data/FlexSDR S8010-01 9770BC.txt"/>
		</Item>
		<Item Name="FlexCompute_grpc_client" Type="Folder">
			<Item Name="FlexCompute_grpc_client.lvlib" Type="Library" URL="../FlexCompute_grpc_client/FlexCompute_grpc_client.lvlib"/>
		</Item>
		<Item Name="FlexSDR_gRPC_client" Type="Folder">
			<Item Name="FlexSDR_gRPC_client.lvlib" Type="Library" URL="../FlexSDR_gRPC_client/FlexSDR_gRPC_client.lvlib"/>
		</Item>
		<Item Name="Sub VIs" Type="Folder">
			<Item Name="Device_Measurement_Retrieve.vi" Type="VI" URL="../FlexSDR_gRPC_client/Sub VIs/Device_Measurement_Retrieve.vi"/>
			<Item Name="Device_Measurement_Start.vi" Type="VI" URL="../FlexSDR_gRPC_client/Sub VIs/Device_Measurement_Start.vi"/>
			<Item Name="Device_Measurement_Stop.vi" Type="VI" URL="../FlexSDR_gRPC_client/Sub VIs/Device_Measurement_Stop.vi"/>
			<Item Name="Get_Device_Properties.vi" Type="VI" URL="../FlexSDR_gRPC_client/Sub VIs/Get_Device_Properties.vi"/>
			<Item Name="Scan_For_Devices.vi" Type="VI" URL="../FlexSDR_gRPC_client/Sub VIs/Scan_For_Devices.vi"/>
			<Item Name="System_Configuration_Get.vi" Type="VI" URL="../FlexSDR_gRPC_client/Sub VIs/System_Configuration_Get.vi"/>
			<Item Name="System_Configuration_Set.vi" Type="VI" URL="../FlexSDR_gRPC_client/Sub VIs/System_Configuration_Set.vi"/>
		</Item>
		<Item Name="tools" Type="Folder">
			<Item Name="Array Generator.vi" Type="VI" URL="../FlexSDR_gRPC_client/tools/Array Generator.vi"/>
			<Item Name="Calibraiton_Procedure.vi" Type="VI" URL="../FlexSDR_gRPC_client/tools/Calibraiton_Procedure.vi"/>
			<Item Name="FFT_Complex.vi" Type="VI" URL="../FlexSDR_gRPC_client/tools/FFT_Complex.vi"/>
			<Item Name="IP Generator.vi" Type="VI" URL="../FlexSDR_gRPC_client/tools/IP Generator.vi"/>
			<Item Name="IQ_Data_Processing.vi" Type="VI" URL="../FlexSDR_gRPC_client/tools/IQ_Data_Processing.vi"/>
			<Item Name="Run_Calibration_Matlab.vi" Type="VI" URL="../FlexSDR_gRPC_client/tools/Run_Calibration_Matlab.vi"/>
			<Item Name="Save to CSV.vi" Type="VI" URL="../FlexSDR_gRPC_client/tools/Save to CSV.vi"/>
			<Item Name="Write_EQ_and_Enable.vi" Type="VI" URL="../FlexSDR_gRPC_client/tools/Write_EQ_and_Enable.vi"/>
		</Item>
		<Item Name="SDR_front_panel_V1.vi" Type="VI" URL="../FlexSDR_gRPC_client/SDR_front_panel_V1.vi"/>
		<Item Name="sys_front_panel_V1.vi" Type="VI" URL="../FlexSDR_gRPC_client/sys_front_panel_V1.vi"/>
		<Item Name="Test_Device_Info_Panel.vi" Type="VI" URL="../FlexSDR_gRPC_client/Test_Device_Info_Panel.vi"/>
		<Item Name="test_kpi_panel.vi" Type="VI" URL="../test_kpi_panel.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="1D String Array to Delimited String.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/1D String Array to Delimited String.vi"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="Close File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Close File+.vi"/>
				<Item Name="compatReadText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatReadText.vi"/>
				<Item Name="Dynamic To Waveform Array.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/Dynamic To Waveform Array.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="Find First Error.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find First Error.vi"/>
				<Item Name="grpc-lvsupport-release.lvlib" Type="Library" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/grpc-lvsupport-release.lvlib"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="NI_AALPro.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALPro.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="Open File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Open File+.vi"/>
				<Item Name="Random Number (Range) DBL.vi" Type="VI" URL="/&lt;vilib&gt;/numeric/Random Number (Range) DBL.vi"/>
				<Item Name="Random Number (Range) I64.vi" Type="VI" URL="/&lt;vilib&gt;/numeric/Random Number (Range) I64.vi"/>
				<Item Name="Random Number (Range) U64.vi" Type="VI" URL="/&lt;vilib&gt;/numeric/Random Number (Range) U64.vi"/>
				<Item Name="Random Number (Range).vi" Type="VI" URL="/&lt;vilib&gt;/numeric/Random Number (Range).vi"/>
				<Item Name="Read Delimited Spreadsheet (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Delimited Spreadsheet (DBL).vi"/>
				<Item Name="Read Delimited Spreadsheet (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Delimited Spreadsheet (I64).vi"/>
				<Item Name="Read Delimited Spreadsheet (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Delimited Spreadsheet (string).vi"/>
				<Item Name="Read Delimited Spreadsheet.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Delimited Spreadsheet.vi"/>
				<Item Name="Read File+ (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read File+ (string).vi"/>
				<Item Name="Read Lines From File (with error IO).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Lines From File (with error IO).vi"/>
				<Item Name="sub_Random U32.vi" Type="VI" URL="/&lt;vilib&gt;/numeric/sub_Random U32.vi"/>
				<Item Name="subBuildXYGraph.vi" Type="VI" URL="/&lt;vilib&gt;/express/express controls/BuildXYGraphBlock.llb/subBuildXYGraph.vi"/>
				<Item Name="subTimeDelay.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/TimeDelayBlock.llb/subTimeDelay.vi"/>
				<Item Name="System Exec.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/System Exec.vi"/>
				<Item Name="Waveform Array To Dynamic.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/Waveform Array To Dynamic.vi"/>
				<Item Name="Write Delimited Spreadsheet (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (DBL).vi"/>
				<Item Name="Write Delimited Spreadsheet (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (I64).vi"/>
				<Item Name="Write Delimited Spreadsheet (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (string).vi"/>
				<Item Name="Write Delimited Spreadsheet.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet.vi"/>
				<Item Name="Write Spreadsheet String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Spreadsheet String.vi"/>
			</Item>
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
