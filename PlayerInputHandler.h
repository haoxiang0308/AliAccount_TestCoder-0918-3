#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "PlayerInputHandler.generated.h"

UCLASS()
class APlayerInputHandler : public ACharacter
{
    GENERATED_BODY()

public:
    // Sets default values for this character's properties
    APlayerInputHandler();

protected:
    // Called when the game starts or when spawned
    virtual void BeginPlay() override;

    // Input mapping functions
    void MoveForward(float Value);
    void MoveRight(float Value);
    void LookUp(float Value);
    void Turn(float Value);
    void JumpAction();
    void FireAction();

    // Input components
    void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;

private:
    // Camera components
    class USpringArmComponent* CameraBoom;
    class UCameraComponent* FollowCamera;

    // Movement variables
    float MoveForwardValue;
    float MoveRightValue;
};