type FeatureCardProps = {
  name: string;
  description?: string;
};

export function FeatureCard({ name, description }: FeatureCardProps) {
  return (
    <article aria-label={name}>
      <h2>{name}</h2>
      {description ? <p>{description}</p> : null}
    </article>
  );
}
