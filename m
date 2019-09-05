Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 960F3AA21B
	for <lists+cocci@lfdr.de>; Thu,  5 Sep 2019 13:57:46 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x85BuPDH020545;
	Thu, 5 Sep 2019 13:56:25 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 7E49777C3;
	Thu,  5 Sep 2019 13:56:24 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 0770C7796
 for <cocci@systeme.lip6.fr>; Thu,  5 Sep 2019 13:17:09 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x85BH80R026878
 for <cocci@systeme.lip6.fr>; Thu, 5 Sep 2019 13:17:08 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72A5B28
 for <cocci@systeme.lip6.fr>; Thu,  5 Sep 2019 04:17:07 -0700 (PDT)
Received: from [10.1.194.37] (e113632-lin.cambridge.arm.com [10.1.194.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 386DE3F718
 for <cocci@systeme.lip6.fr>; Thu,  5 Sep 2019 04:17:07 -0700 (PDT)
To: cocci@systeme.lip6.fr
From: Valentin Schneider <valentin.schneider@arm.com>
Message-ID: <d9df847c-199d-e78d-aff2-6f14629d63b5@arm.com>
Date: Thu, 5 Sep 2019 12:17:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 05 Sep 2019 13:56:25 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 05 Sep 2019 13:17:08 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Thu, 05 Sep 2019 13:56:20 +0200
Subject: [Cocci] Matching variable declarations
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

Hi,

I'm trying to change the type of variables that match a certain rule.
Abstracting away this specific rule and only looking at coming up with a
rule to match variable declarations, I have a few newbie questions.

Say I want to replace all long declarations into ints, this simple rule
seems to be working fine:

---
@@
identifier var;
type T = long;
expression E;
@@

(
- T var;
+ int var;
|
- T var = E;
+ int var = E;
)
---

I tried to write it as
---
- T
+ int
var
? = E
;
---
but that doesn't seem to be a valid syntax.


Now, I'd like to match declarations of several variables in a single
statement as well.

Say I want to get something like

- long a, b = 2, c, d = 42, e;
+ long a, b = 2, c, e;
+ int d = 42;

 (match on longs initialized to 42)

My current attempt is
---
@@
identifier var;
type T = long;
expression L, R;
@@

T L,
- var = 42
R;
+ int var;
---
But that isn't valid either. How should I go about writing this sort of
rule?

If you're curious, there's more context about what I'm trying to achieve
at:

https://lore.kernel.org/lkml/20190902210558.GA23013@avx2/

Thanks,
Valentin
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
