param (
    [Parameter(Mandatory=$true)]
    [string]$FeatureName
)

# Convert snake_case to PascalCase for class names
function To-PascalCase($string) {
    $words = $string.Split('_')
    $pascal = ""
    foreach ($word in $words) {
        if ($word.Length -gt 0) {
            $pascal += $word.Substring(0,1).ToUpper() + $word.Substring(1).ToLower()
        }
    }
    return $pascal
}

$PascalName = To-PascalCase $FeatureName
$SnakeName = $FeatureName.ToLower()

$BaseDir = "lib/features/feature_$SnakeName"
$PresentationDir = "$BaseDir/presentation"
$BlocDir = "$PresentationDir/bloc"
$ScreenDir = "$PresentationDir/screen"
$WidgetDir = "$PresentationDir/widget"
$BasePresentationDir = "$PresentationDir/base"
$RouterDir = "$PresentationDir/router"

$DataDir = "$BaseDir/data"
$DataSourceDir = "$DataDir/data_source"
$RemoteDataSourceDir = "$DataSourceDir/remote"
$RepositoryImplDir = "$DataDir/repository"

$DomainDir = "$BaseDir/domain"
$EntityDir = "$DomainDir/entity"
$RepositoryDir = "$DomainDir/repository"

# Create Directories
$Dirs = $BaseDir, $PresentationDir, $BlocDir, $ScreenDir, $WidgetDir, $BasePresentationDir, $RouterDir, `
        $DataDir, $DataSourceDir, $RemoteDataSourceDir, $RepositoryImplDir, `
        $DomainDir, $EntityDir, $RepositoryDir

foreach ($Dir in $Dirs) {
    if (-not (Test-Path $Dir)) {
        New-Item -ItemType Directory -Path $Dir -Force | Out-Null
    }
}

Write-Host "Creating feature: $PascalName ($SnakeName)" -ForegroundColor Cyan

# --- DOMAIN LAYER ---

# 1. Entity
$EntityPath = "$EntityDir/${SnakeName}_entity.dart"
$EntityContent = @"
class ${PascalName}Entity {
  // TODO: Add properties
}
"@
Set-Content -Path $EntityPath -Value $EntityContent

# 2. Repository Interface
$RepoPath = "$RepositoryDir/${SnakeName}_repository.dart"
$RepoContent = @"
import '../../../../core/resources/data_state.dart';
import '../entity/${SnakeName}_entity.dart';

abstract class ${PascalName}Repository {
  Future<DataState<${PascalName}Entity>> fetch${PascalName}Data();
}
"@
Set-Content -Path $RepoPath -Value $RepoContent


# --- DATA LAYER ---

# 3. API Provider / Remote Data Source
$ApiProviderPath = "$RemoteDataSourceDir/${SnakeName}_api_provider.dart"
$ApiProviderContent = @"
import 'package:dio/dio.dart';

class ${PascalName}ApiProvider {
  final Dio _dio = Dio(); // Consider injecting or using global dio

  Future<Response> get${PascalName}Data() async {
    // return await _dio.get('YOUR_ENDPOINT');
    throw UnimplementedError();
  }
}
"@
Set-Content -Path $ApiProviderPath -Value $ApiProviderContent

# 4. Repository Implementation
$RepoImplPath = "$RepositoryImplDir/${SnakeName}_repository_impl.dart"
$RepoImplContent = @"
import '../../../../core/resources/data_state.dart';
import '../../domain/entity/${SnakeName}_entity.dart';
import '../../domain/repository/${SnakeName}_repository.dart';
import '../data_source/remote/${SnakeName}_api_provider.dart';

class ${PascalName}RepositoryImpl extends ${PascalName}Repository {
  final ${PascalName}ApiProvider _apiProvider;
  ${PascalName}RepositoryImpl(this._apiProvider);

  @override
  Future<DataState<${PascalName}Entity>> fetch${PascalName}Data() async {
    try {
      final response = await _apiProvider.get${PascalName}Data();
      if (response.statusCode == 200) {
        // TODO: Map to Entity
        return DataSuccess(${PascalName}Entity());
      } else {
        return DataFailed(response.statusMessage ?? "Error");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
"@
Set-Content -Path $RepoImplPath -Value $RepoImplContent


# --- PRESENTATION LAYER ---

# 5. Base Feature State
$BaseStatePath = "$BasePresentationDir/base_${SnakeName}_stateful_widget_state.dart"
$BaseStateContent = @"
import 'package:flutter/material.dart';
import '../../../../core/base/base_screen_state.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';

abstract class Base${PascalName}StatefulWidgetState<T extends StatefulWidget, S extends BaseBloc> extends BaseScreenState<T, S> {
  Base${PascalName}StatefulWidgetState(super.bloc);

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState);
}
"@
Set-Content -Path $BaseStatePath -Value $BaseStateContent

# 6. Bloc Files
$BlocPath = "$BlocDir/${SnakeName}_bloc.dart"
$BlocContent = @"
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../domain/repository/${SnakeName}_repository.dart';
import '../../../../core/resources/data_state.dart';

part '${SnakeName}_event.dart';
part '${SnakeName}_state.dart';

class ${PascalName}Bloc extends BaseBloc<${PascalName}Event, ${PascalName}State> {
  final ${PascalName}Repository ${SnakeName}Repository;

  ${PascalName}Bloc(this.${SnakeName}Repository) : super(${PascalName}Initial()) {
    on<Fetch${PascalName}DataEvent>((event, emit) async {
      emit(${PascalName}Loading());
      DataState dataState = await ${SnakeName}Repository.fetch${PascalName}Data();

      if (dataState is DataSuccess) {
        emit(${PascalName}Loaded());
      } else {
        emit(${PascalName}Error(dataState.error ?? "Unknown Error"));
      }
    });
  }
}
"@
Set-Content -Path $BlocPath -Value $BlocContent

$EventPath = "$BlocDir/${SnakeName}_event.dart"
$EventContent = @"
part '${SnakeName}_bloc.dart';

abstract class ${PascalName}Event {}

class Fetch${PascalName}DataEvent extends ${PascalName}Event {}
"@
Set-Content -Path $EventPath -Value $EventContent

$StatePath = "$BlocDir/${SnakeName}_state.dart"
$StateContent = @"
part '${SnakeName}_bloc.dart';

abstract class ${PascalName}State {}

class ${PascalName}Initial extends ${PascalName}State {}

class ${PascalName}Loading extends ${PascalName}State {}

class ${PascalName}Loaded extends ${PascalName}State {}

class ${PascalName}Error extends ${PascalName}State {
  final String message;
  ${PascalName}Error(this.message);
}
"@
Set-Content -Path $StatePath -Value $StateContent

# 7. Screen File
$ScreenPath = "$ScreenDir/screen_${SnakeName}.dart"
$ScreenContent = @"
import 'package:flutter/material.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../base/base_${SnakeName}_stateful_widget_state.dart';
import '../bloc/${SnakeName}_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen${PascalName} extends StatefulWidget {
  const Screen${PascalName}({super.key});

  @override
  State<Screen${PascalName}> createState() => _Screen${PascalName}State();
}

class _Screen${PascalName}State extends Base${PascalName}StatefulWidgetState<Screen${PascalName}, ${PascalName}Bloc> {
  _Screen${PascalName}State() : super(locator<${PascalName}Bloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(Fetch${PascalName}DataEvent());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${PascalName} Feature'),
      ),
      body: BlocBuilder<${PascalName}Bloc, ${PascalName}State>(
        builder: (context, state) {
          if (state is ${PascalName}Loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ${PascalName}Error) {
            return Center(child: Text(state.message));
          }
          return const Center(
            child: Text('Welcome to the ${PascalName} feature!'),
          );
        },
      ),
    );
  }
}
"@
Set-Content -Path $ScreenPath -Value $ScreenContent

# 8. Router File
$RouterPath = "$RouterDir/${SnakeName}_router.dart"
$RouterContent = @"
import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/screen_${SnakeName}.dart';

class ${PascalName}Router implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: '${SnakeName}',
          path: '/${SnakeName}',
          builder: (context, state) => const Screen${PascalName}(),
        ),
      ];
}
"@
Set-Content -Path $RouterPath -Value $RouterContent

Write-Host "Feature '$SnakeName' created successfully" -ForegroundColor Green
Write-Host "Don't forget to:" -ForegroundColor Yellow
Write-Host "1. Register ApiProvider, Repository, and Bloc in locator.dart." -ForegroundColor Yellow
Write-Host "2. Add ${PascalName}Router().routes to lib/core/services/router.dart." -ForegroundColor Yellow
