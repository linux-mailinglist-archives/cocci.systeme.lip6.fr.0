Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F9336603
	for <lists+cocci@lfdr.de>; Wed,  5 Jun 2019 22:53:26 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x55KqnXf014046;
	Wed, 5 Jun 2019 22:52:49 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1342B776C;
	Wed,  5 Jun 2019 22:52:49 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 2CFC97767
 for <cocci@systeme.lip6.fr>; Wed,  5 Jun 2019 22:52:47 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x55KqkcH025245
 for <cocci@systeme.lip6.fr>; Wed, 5 Jun 2019 22:52:46 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,556,1549926000"; d="scan'208";a="308298548"
Received: from abo-161-111-68.mrs.modulonet.fr (HELO hadrien) ([85.68.111.161])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 22:52:46 +0200
Date: Wed, 5 Jun 2019 22:52:45 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <5c138195-ac1a-4ad6-c6e6-720acd4ea34f@metux.net>
Message-ID: <alpine.DEB.2.21.1906052251550.2622@hadrien>
References: <5c138195-ac1a-4ad6-c6e6-720acd4ea34f@metux.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 05 Jun 2019 22:52:50 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Wed, 05 Jun 2019 22:52:46 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] how to replace obsolete #ifdef's
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



On Wed, 5 Jun 2019, Enrico Weigelt, metux IT consult wrote:

> Hi folks,
>
>
> is there a way to replace obsolete #ifdef's via spatch ?
>
> Here's my scenario:
>
> In the linux kernel we have many places where drivers statically assign
> pointers to match tables (eg. for oftree or acpi) into a global driver
> struct - sometimes this is enclosed into some #ifdef CONFIG_..., when
> things like oftree or acpi are optional.
>
> Example patch for illustrating what I'd like to do:
>
> --- a/sound/soc/codecs/pcm3060-i2c.c
> +++ b/sound/soc/codecs/pcm3060-i2c.c
> @@ -45,9 +45,7 @@ static int pcm3060_i2c_probe(struct i2c_client *i2c,
>  static struct i2c_driver pcm3060_i2c_driver = {
>         .driver = {
>                 .name = "pcm3060",
> -#ifdef CONFIG_OF
> -               .of_match_table = pcm3060_of_match,
> -#endif /* CONFIG_OF */
> +               .of_match_table = of_match_ptr(pcm3060_of_match),
>         },
>         .id_table = pcm3060_i2c_id,
>         .probe = pcm3060_i2c_probe,
>
>
> Just wrapping the assignment into the macro call turned out to be easy.
> But I haven't found a way to remove the now #ifdef :(

In principle you can remove some initializations and add them back.  But
doing so would have the unfortunate side effect of removing the newlines.
So I am trying to fix that.

julia


>
> Any idea how I could solve this ?
>
>
> --mtx
>
> --
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
