Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CA57BF40
	for <lists+cocci@lfdr.de>; Wed, 31 Jul 2019 13:28:06 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6VBRhUL002245;
	Wed, 31 Jul 2019 13:27:43 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 86BE2779E;
	Wed, 31 Jul 2019 13:27:43 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 54ECF7781
 for <cocci@systeme.lip6.fr>; Wed, 31 Jul 2019 13:27:42 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6VBRfUB002065
 for <cocci@systeme.lip6.fr>; Wed, 31 Jul 2019 13:27:41 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,330,1559512800"; d="scan'208";a="315249665"
Received: from 71-219-88-14.chvl.qwest.net (HELO hadrien) ([71.219.88.14])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 13:27:40 +0200
Date: Wed, 31 Jul 2019 07:27:39 -0400 (EDT)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Chuhong Yuan <hslester96@gmail.com>
In-Reply-To: <CANhBUQ0Rc5Q=R6Ufc=UEmLe4d0emQz4Cv+VsoA_7v=mHBY_LuQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1907310723090.9202@hadrien>
References: <CANhBUQ0Rc5Q=R6Ufc=UEmLe4d0emQz4Cv+VsoA_7v=mHBY_LuQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 31 Jul 2019 13:27:43 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Wed, 31 Jul 2019 13:27:41 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] How to match all conditions in if-else if blocks?
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



On Tue, 30 Jul 2019, Chuhong Yuan wrote:

> Hi all,
> I want to write a script to match a pattern of conditional statement.
> However, I find that I can only match the first "if" in the block.
> The script is like this:
> fn(...) {
> ...
> - f(arg1, arg2, arg3)
> ...
> }
> where f returns the condition check result.

... means that what is before and after should not appear in the code
matched by ...  This is useful for patterns like

A
...
B

when you want the closest A and B.

You can remove this restriction using

... when any

However that will not completely solve your problem, because when
transformation is used with ..., the patterns have to appear on every
control-flow path.

To eliminate this constraint, you can use

fn(...) {
<...
- f(...)
...> }

The <... ...> allows the pattern to appear 0 or more times in the matched
region.  If you want to be sure that it appears one or more times, you can
use <+... ...+>.  But the latter is more expensive and may not be
necessary.

On the other hand, if the name of the function is not very important, it
would be much more efficient to just match the function call that you are
interested in directly, without putting the function definition pattern
around it.

julia


>
> But when I apply to source code like this:
> if (f(a1, a2, a3)) {
> ...
> } else if (f(a4, a5, a6)) {
> ...
> }
> I find it can only match f(a1, a2, a3).
> So how to fix this problem?
>
> Thanks,
> Chuhong
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
