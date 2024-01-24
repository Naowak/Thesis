# Run Jupyter Notebook with Plafrim

## Reminder

Username : `ai4i-gen17`  
Password : `kttUn7qrmY`

## Connect to plafrim

On Terminal 1

```
ssh ai4i-gen17@formation.plafrim.fr
```

```
ssh plafrim
```


## See available GPU (optional)

On Terminal 1

```
sinfo
```

## Allocate a GPU

On Terminal 1

```
salloc -w sirocco06
```

```
ssh sirocco06
```

## Run the Jupyter Notebook

*Choose a random port between 8 000 and 50 000.*  
*Do not forget to replace \<PORT> by that number.*

On Terminal 1

```
module load build/conda
```

```
conda activate /home/ai4i/envs/ai4industry
```

```
jupyter notebook --ip=0.0.0.0 --port=<PORT>
```

## Créer le tunnel ssh

*Do not forget to replace \<PORT> by that number.*

On Terminal 2

```
ssh -o 'ForwardAgent=yes' ai4i-gen17@formation.plafrim.fr "ssh-add"
```

```
ssh -o 'ForwardAgent=yes' -t -L <PORT>:localhost:<PORT> ai4i-gen17@sirocco06 -J ai4i-gen17@formation.plafrim.fr
```


