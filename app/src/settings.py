"""Module to centralize configurations, environment variables and all things
related to the preferences.
"""


from configparser import ConfigParser
import os


def load_configs(filepath):
    parser = ConfigParser()
    parser.read(filepath)

    print('sections:', parser.sections())

    config = dict()
    for section in parser.sections():
        config[section] = dict()
        params = parser.items(section)

        for param in params:
            config[section][param[0]] = param[1]

    return config


class Env(object):
    """Centralizes environment variables
    """

    __is_loaded = False

    APP_ROOT_PATH = None
    STATIC_PATH = None
    HTML_TEMPLATES_PATH = None

    DB_CONFIGS = None
    
    @classmethod
    def load(cls):
        if not Env.__is_loaded:
            Env.APP_ROOT_PATH = os.environ['APP_ROOT_PATH']
            Env.STATIC_PATH = f'{Env.APP_ROOT_PATH}/static'
            Env.HTML_TEMPLATES_PATH = f'{Env.APP_ROOT_PATH}/html_templates'

            Env.__load_db_configs()

            Env.__is_loaded = True

    @classmethod
    def show(cls): # TODO hide passwords
        return f"""APP_ROOT_PATH: {Env.APP_ROOT_PATH}
STATIC_PATH: {Env.STATIC_PATH}
DB_CONFIGS: {Env.DB_CONFIGS}
"""

    @classmethod
    def __load_db_configs(cls):
        filepath = f'{Env.APP_ROOT_PATH}/database.ini'
        Env.DB_CONFIGS = load_configs(filepath)
