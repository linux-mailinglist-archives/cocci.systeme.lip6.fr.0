Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA43DEC0A9
	for <lists+cocci@lfdr.de>; Fri,  1 Nov 2019 10:38:27 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA19cAOe020924;
	Fri, 1 Nov 2019 10:38:10 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 86A3777C0;
	Fri,  1 Nov 2019 10:38:10 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A68C8454C
 for <cocci@systeme.lip6.fr>; Fri,  1 Nov 2019 10:38:09 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA19c92W024370
 for <cocci@systeme.lip6.fr>; Fri, 1 Nov 2019 10:38:09 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,254,1569276000"; d="scan'208";a="409896577"
Received: from abo-45-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.45])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Nov 2019 10:38:09 +0100
Date: Fri, 1 Nov 2019 10:38:08 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <08618116-cd93-fedb-f90e-64c17b319794@web.de>
Message-ID: <alpine.DEB.2.21.1911011037250.2883@hadrien>
References: <708207db-69d7-8962-e507-cd705142d0c4@web.de>
 <226b4ce7-8284-ed03-a478-98e3e532cb15@web.de>
 <08618116-cd93-fedb-f90e-64c17b319794@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-224004671-1572601089=:2883"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 01 Nov 2019 10:38:12 +0100 (CET)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Fri, 01 Nov 2019 10:38:09 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking the occurrence of trailing spaces in a
 semantic patch
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-224004671-1572601089=:2883
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Fri, 1 Nov 2019, Markus Elfring wrote:

> > The following SmPL script variant can generate an usable test result.
>
> Yesterday I noticed during the preparation of a corresponding commit
> that unwanted space characters were added at three places in the generated patch.
>
> elfring@Sonne:~/Projekte/Linux/next-patched> spatch --in-place drivers/scsi/megaraid/megaraid_sas_base.c ~/Projekte/Coccinelle/janitor/move_error_code_assignment_to_function_end2.cocci
>
> git GUI:
> …
> @@ -8270,31 +8270,24 @@ static int megasas_mgmt_ioctl_fw(struct file *file, unsigned long arg)
> …
> +	if (!instance)
> …
> +	if (instance->requestorId && !allow_vf_ioctls)
> …
> +	if (instance->unload == 1)
> …

And the unwanted space characters are where?

>
> How would you like to improve the pretty-printing for the Coccinelle software?

I don't know.  How would you like to improve the pretty-printing for the
Coccinelle software?

julia
--8323329-224004671-1572601089=:2883
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-224004671-1572601089=:2883--
