''' Settable configuration parameters with defaults from config.yaml '''

import yaml, os
from pathlib import Path
from importlib_resources import files, as_file
import pyInovEval.config

_data_resource = files(pyInovEval.config).joinpath('config.yaml')


class Config:
    ''' Read default params from config.yaml, implement get/set methods '''

    # Read default config from yaml
    with as_file(_data_resource) as yamlfile:
        with open(yamlfile) as f:
            _conf = yaml.load(f, Loader=yaml.Loader)    

    # Database parameters
    _win_dbDriver = _conf['database']['mac_driver']
    _mac_dbDriver = _conf['database']['windows_driver']    
    _dbHost       = _conf['database']['host']
    _dbName       = str(_conf['database']['database_name'])    
    _dbPort       = str(_conf['database']['port'])

    if os.name == 'nt':
        _dbDriver = _win_dbDriver
    else:
        _dbDriver = _mac_dbDriver

    # Logging parameters
    _win_logDir = _conf['logging']['windows_log_directory']
    _mac_logDir = _conf['logging']['mac_log_directory']
    
    if os.name == 'nt':
        _logFile = Path(_win_logDir, 'pyInovEval.log')
    else:
        _logFile = Path(_mac_logDir, 'pyInovEval.log')

    @staticmethod
    def get(name):
        return getattr(Config, '_' + name)

    @staticmethod
    def set(name, value):
        setattr(Config, '_' + name, value)
