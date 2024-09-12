import pandas as pd

csv_file = '/var/log/cpu_memory_usage.csv'

df = pd.read_csv(csv_file, parse_dates=['Timestamp'])

df['Timestamp'] = pd.to_datetime(df['Timestamp'])

df['CPU_Usage(%)'] = pd.to_numeric(df['CPU_Usage(%)'], errors='coerce')
df['Memory_Used(MB)'] = pd.to_numeric(df['Memory_Used(MB)'], errors='coerce')

max_cpu_usage_row = df.loc[df['CPU_Usage(%)'].idxmax()]
max_cpu_usage = max_cpu_usage_row['CPU_Usage(%)']
max_cpu_time = max_cpu_usage_row['Timestamp']

df['Memory_Used(MB)'] = pd.to_numeric(df['Memory_Used(MB)'], errors='coerce')
max_memory_usage_row = df.loc[df['Memory_Used(MB)'].idxmax()]
max_memory_usage = max_memory_usage_row['Memory_Used(MB)']
max_memory_time = max_memory_usage_row['Timestamp']

df.set_index('Timestamp', inplace=True)
daily_stats = df.resample('D').agg({
    'CPU_Usage(%)': ['mean', 'median'],
    'Memory_Used(MB)': ['mean', 'median']
}).reset_index()

print(f"Max CPU Usage: {max_cpu_usage}% at {max_cpu_time}")
print(f"Max Memory Usage: {max_memory_usage} MB at {max_memory_time}")
print("\nDaily Average and Median CPU and Memory Usage:")
print(daily_stats)

daily_stats.to_csv('/var/log/daily_usage_stats.csv', index=False)