// PlayerInputHandler_NKdSdv9YHhGC.cpp
// A class that handles player input in Unreal Engine

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "GameFramework/Pawn.h"
#include "GameFramework/Character.h"
#include "PlayerInputHandler_NKdSdv9YHhGC.h"

// Sets default values
APlayerInputHandler::APlayerInputHandler()
{
	// Set this character to call Tick() every frame. You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
	
	// Setup input bindings
	SetupPlayerInputComponent(InputComponent);
}

// Called every frame
void APlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}

// Called to bind functionality to input
void APlayerInputHandler::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Bind movement events
	PlayerInputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
	PlayerInputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
	
	// Bind rotation events
	PlayerInputComponent->BindAxis("Turn", this, &APlayerInputHandler::AddControllerYawInput);
	PlayerInputComponent->BindAxis("LookUp", this, &APlayerInputHandler::AddControllerPitchInput);
	
	// Bind action events
	PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &ACharacter::Jump);
	PlayerInputComponent->BindAction("Jump", IE_Released, this, &ACharacter::StopJumping);
	PlayerInputComponent->BindAction("Interact", IE_Pressed, this, &APlayerInputHandler::Interact);
}

void APlayerInputHandler::MoveForward(float Value)
{
	if ((Controller != nullptr) && (Value != 0.0f))
	{
		// Find out which way is forward
		const FRotator Rotation = Controller->GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);

		// Get forward vector
		const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
		AddMovementInput(Direction, Value);
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	if ((Controller != nullptr) && (Value != 0.0f))
	{
		// Find out which way is right
		const FRotator Rotation = Controller->GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);

		// Get right vector
		const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
		AddMovementInput(Direction, Value);
	}
}

void APlayerInputHandler::Interact()
{
	// Handle interaction logic here
	UE_LOG(LogTemp, Warning, TEXT("Player Interacted with something!"));
	
	// Perform line trace to find object to interact with
	FHitResult HitResult;
 FVector StartLocation = GetActorLocation();
 FVector EndLocation = StartLocation + GetActorForwardVector() * 500.0f;
	
	FCollisionQueryParams CollisionParams;
	CollisionParams.AddIgnoredActor(this);
	
	if (GetWorld()->LineTraceSingleByChannel(HitResult, StartLocation, EndLocation, ECC_Visibility, CollisionParams))
	{
		// If we hit something, call its interact function
		if (HitResult.GetActor() != nullptr)
		{
			UE_LOG(LogTemp, Warning, TEXT("Hit Actor: %s"), *HitResult.GetActor()->GetName());
		}
	}
}