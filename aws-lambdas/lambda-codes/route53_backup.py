"""route53 backup"""
from datetime import datetime
import json
import sys
import boto3

ROUTE53 = boto3.client('route53')
S3 = boto3.resource('s3')

PAGINATE_HOSTED_ZONES = ROUTE53.get_paginator('list_hosted_zones')
PAGINATE_RESOURCE_RECORD_SETS = ROUTE53.get_paginator('list_resource_record_sets')

DOMAINS = [domain.lower().rstrip('.') for domain in sys.argv[1:]]

def current_time():
    """timestamp"""
    return datetime.now().strftime('%Y-%m-%d %H:%M:%S')

DATA = []

for zone_page in PAGINATE_HOSTED_ZONES.paginate():
    for zone in zone_page['HostedZones']:
        if DOMAINS and not zone['Name'].lower().rstrip('.') in DOMAINS:
            continue

        for record_page in PAGINATE_RESOURCE_RECORD_SETS.paginate(HostedZoneId=zone['Id']):
            for record in record_page['ResourceRecordSets']:
                DATA.append(record)

def lambda_handler(event, context):
    """lambda handler"""
    output = json.dumps(DATA, indent=4)
    S3.Bucket('258772036713-route53-backup').put_object(Key='Complete DNS List/' + current_time(),
                                              Body=output)
