from telnetlib import EC
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
import time
#import pandas as pd

options = webdriver.ChromeOptions()
options.add_argument('--start-maximized')
options.add_argument('--disable-extensions')

driver_path = '/usr/lib/chromium-browser/chromedriver'
driver = webdriver.Chrome(driver_path, chrome_options=options)

def youtube():
  # load page
  driver.set_window_position(100,0)
  time.sleep(1)
  driver.get('https://www.youtube.com/watch?v=0AvX54Rp4sc')

  # input

  WebDriverWait(driver, 5)\
    .until(EC.element_to_be_clickable((By.CSS_SELECTOR, 'input#search')))\
    .send_keys('Carlos Tevez')

  WebDriverWait(driver, 5)\
    .until(EC.element_to_be_clickable((By.CSS_SELECTOR, 'input#search')))\
    .send_keys(Keys.ENTER)

youtube()
