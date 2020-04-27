from faker import Faker
import argparse
import logging
import random
import datetime

def faker_gen(table_name,field_names,field_types,num_rows):
    field_names_parsed = [str(item) for item in field_names.split(',')]
    field_types_parsed = [str(item) for item in field_types.split(',')]
    assert(len(field_names_parsed) == len(field_types_parsed))
    logging.basicConfig(level=logging.INFO)
    file_name = "raw_data/data_"+table_name + ".csv"
    logging.info('Generating file {} ...'.format(file_name))
    with open(file_name, 'w') as f:
        fake = Faker(['es_ES'])
        i = 1
        date = datetime.date(2020, 8, 1)
        for _ in range(num_rows):
            for field_name, field_type in zip(field_names_parsed, field_types_parsed):
                if field_type == 'ID':
                    fake_data = i
                    i = i +1
                elif field_type == 'NAME':
                    fake_data = fake.name().replace(',', '')
                elif field_type == 'DATE_SEQUENTIAL':
                    fake_data = date
                    date += datetime.timedelta(days=1)
                elif field_type == 'DATE':
                    fake_data = fake.date_this_year()
                elif field_type == 'CITY':
                    fake_data = fake.city()
                elif field_type == 'EMPTY':
                    fake_data = ""
                elif field_type == 'EMAIL':
                    fake_data = fake.ascii_safe_email()
                elif field_type == 'COMPANY':
                    fake_data = fake.company().replace(',', '')
                elif field_type == 'PRICE':
                    fake_data = fake.numerify(text='##€')
                elif field_type == 'WORD':
                    fake_data = fake.word()
                elif field_type == 'RANGE':
                    range_value = int(field_name)
                    fake_data = random.randint(1,range_value)
                else:
                    fake_data = "OOV"
                f.write(str(fake_data))
                if( not field_names_parsed.index(field_name)+1==len(field_names_parsed)):
                    f.write(",")
            f.write("\n")

def main(params):
    faker_gen(params.table_name,params.field_names,params.field_types,params.num_rows)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--table_name',help="table name", type=str, required=True)
    parser.add_argument('--field_names', help="field name lists", type=str, required=True)
    parser.add_argument('--field_types', help="field name types", type=str, required=True)
    parser.add_argument('--num_rows', help="number of rows", type=int, required=True)
    parser.parse_args()
    params = parser.parse_args()
    main(params)






