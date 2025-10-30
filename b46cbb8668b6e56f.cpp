#include "PlayerInputHandler.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"

APlayerInputHandler::APlayerInputHandler()
{
    // Set this pawn to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
    PrimaryActorTick.bCanEverTick = true;
}

void APlayerInputHandler::BeginPlay()
{
    Super::BeginPlay();

    // Add Input Mapping Context
    if (APlayerController* PlayerController = Cast<APlayerController>(Controller))
    {
        if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(PlayerController->GetLocalPlayer()))
        {
            Subsystem->AddMappingContext(DefaultMappingContext, 0);
        }
    }
}

void APlayerInputHandler::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);
}

void APlayerInputHandler::SetupInputComponent()
{
    Super::SetupInputComponent();

    // Set up action bindings
    if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(InputComponent))
    {
        // Jumping
        EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::Jump);

        // Moving
        EnhancedInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveForward);
        EnhancedInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveRight);

        // Looking
        EnhancedInputComponent->BindAction(LookUpAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::LookUp);
        EnhancedInputComponent->BindAction(TurnAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::Turn);

        // Fire
        EnhancedInputComponent->BindAction(FireAction, ETriggerEvent::Started, this, &APlayerInputHandler::Fire);
    }
}

void APlayerInputHandler::MoveForward(float Value)
{
    if (Value != 0.0f)
    {
        // Add movement in that direction
        AddMovementInput(GetActorForwardVector(), Value);
    }
}

void APlayerInputHandler::MoveRight(float Value)
{
    if (Value != 0.0f)
    {
        // Add movement in that direction
        AddMovementInput(GetActorRightVector(), Value);
    }
}

void APlayerInputHandler::LookUp(float Value)
{
    AddControllerPitchInput(Value);
}

void APlayerInputHandler::Turn(float Value)
{
    AddControllerYawInput(Value);
}

void APlayerInputHandler::Jump()
{
    // Handle jump input
    ACharacter* Character = Cast<ACharacter>(GetPawn());
    if (Character)
    {
        Character->Jump();
    }
}

void APlayerInputHandler::Fire()
{
    // Handle fire input
    // Add your fire logic here
}