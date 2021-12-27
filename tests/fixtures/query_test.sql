CREATE TABLE IF NOT EXISTS iotdevice.iotdevice01
(
    `cpu_temp` Float64,
    `cpu_freq` Float64,
    `mem_usage` Float64,
    `swap_usage` Float64,
    `disk_usage` Float64,
    `measured_date` DateTime('UTC')
)
ENGINE = MergeTree()
PARTITION BY toYYYYMM(measured_date)
ORDER BY (measured_date)
