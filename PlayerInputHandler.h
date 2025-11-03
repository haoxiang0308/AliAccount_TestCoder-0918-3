#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "PlayerInputHandler.generated.h"

UCLASS()
class APlayerInputHandler : public ACharacter
{
    GENERATED_BODY()

public:
    APlayerInputHandler();

protected:
    virtual void BeginPlay() override;

public:
    virtual void Tick(float DeltaTime) override;
    virtual void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;

    // Movement functions
    void MoveForward(float Value);
    void MoveRight(float Value);

    // Look functions
    void LookUp(float Value);
    void Turn(float Value);

    // Action functions
    void JumpAction();
    void FireAction();

private:
    // Input mapping context
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    class UInputMappingContext* DefaultMappingContext;

    // Input action references
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    class UInputAction* MoveForwardAction;

    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    class UInputAction* MoveRightAction;

    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    class UInputAction* LookUpAction;

    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    class UInputAction* TurnAction;

    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    class UInputAction* JumpActionInput;

    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    class UInputAction* FireActionInput;
};