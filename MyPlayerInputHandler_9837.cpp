#include "MyPlayerInputHandler.h"
#include "Engine/Engine.h"
#include "GameFramework/PlayerController.h"
#include "GameFramework/Character.h"

// Sets default values
AMyPlayerInputHandler::AMyPlayerInputHandler()
{
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void AMyPlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void AMyPlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

// Called to bind functionality to input
void AMyPlayerInputHandler::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);
	
	check(PlayerInputComponent);

    // Bind axis mappings
    PlayerInputComponent->BindAxis("MoveForward", this, &AMyPlayerInputHandler::MoveForward);
    PlayerInputComponent->BindAxis("MoveRight", this, &AMyPlayerInputHandler::MoveRight);

    // Bind action mappings
    PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &ACharacter::Jump);
    PlayerInputComponent->BindAction("Jump", IE_Released, this, &ACharacter::StopJumping);
    PlayerInputComponent->BindAction("Shoot", IE_Pressed, this, &AMyPlayerInputHandler::Shoot);
}

void AMyPlayerInputHandler::MoveForward(float Value)
{
    if (Controller && Value != 0.f)
    {
        const FRotator Rotation = Controller->GetControlRotation();
        const FRotator YawRotation(0, Rotation.Yaw, 0);

        const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
        AddMovementInput(Direction, Value);
    }
}

void AMyPlayerInputHandler::MoveRight(float Value)
{
    if (Controller && Value != 0.f)
    {
        const FRotator Rotation = Controller->GetControlRotation();
        const FRotator YawRotation(0, Rotation.Yaw, 0);

        const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
        AddMovementInput(Direction, Value);
    }
}

void AMyPlayerInputHandler::Shoot()
{
    // Add shooting logic here
    if (GEngine)
    {
        GEngine->AddOnScreenDebugMessage(-1, 1.5f, FColor::Red, TEXT("Shoot button pressed!"));
    }
}