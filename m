Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D7E2E81EC
	for <lists+cocci@lfdr.de>; Thu, 31 Dec 2020 21:28:36 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BVKS3WL001349;
	Thu, 31 Dec 2020 21:28:03 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 35F8177D5;
	Thu, 31 Dec 2020 21:28:03 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 87198373F
 for <cocci@systeme.lip6.fr>; Thu, 31 Dec 2020 21:28:00 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BVKRxbf013060
 for <cocci@systeme.lip6.fr>; Thu, 31 Dec 2020 21:27:59 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,464,1599516000"; d="scan'208";a="484980800"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Dec 2020 21:27:59 +0100
Date: Thu, 31 Dec 2020 21:27:59 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Joe Perches <joe@perches.com>
In-Reply-To: <cc5722eb472a0a94f3418f6081b10f3c4a7e156d.camel@perches.com>
Message-ID: <alpine.DEB.2.22.394.2012312124290.20387@hadrien>
References: <58a84d03b714f71d231f9cac04af09a6b97c6f04.camel@perches.com>
 <cc5722eb472a0a94f3418f6081b10f3c4a7e156d.camel@perches.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 31 Dec 2020 21:28:07 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 31 Dec 2020 21:27:59 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] cocci: missed strlcpy->strscpy conversion?
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



On Thu, 31 Dec 2020, Joe Perches wrote:

> On Thu, 2020-12-31 at 11:04 -0800, Joe Perches wrote:
> > strlcpy is deprecated.  see: Documentation/process/deprecated.rst
> >
> > Change the calls that do not use the strlcpy return value to the
> > preferred strscpy.
> >
> > Done with cocci script:
> >
> > @@
> > expression e1, e2, e3;
> > @@
> >
> > -	strlcpy(
> > +	strscpy(
> > 	e1, e2, e3);
> >
> > This cocci script leaves the instances where the return value is
> > used unchanged.
>
> Hey Julia.
>
> After using the cocci script above on a test treewide conversion,
> there were a few instances with no return use that were not converted.
>
> Any idea why these were not converted?
> I don't see a pattern.

For a semantic patch like this, where you don't case about type
information and the change is very local, you can use the options:

--no-includes --include-headers

Then the .c files and the .h files will be treated one by one.  The
--no-includes options prevents the .h files from being included into the
.c files, which could causetheir code to get transformed at each
inclusion.  The --include-headers option causes the .h files to be
considered.

>
> The .h files may be because those are the only uses in .h files in the kernel
> but drivers/block/rnbd/rnbd-clt.c I don't understand at all.

The parse is not happy about the for_each_possible_cpu.  It seems that the
heuristic for detecting that as a loop expects that the body of the loop
will have braces.  You can see this with the --parse-c option, ie

spatch --parse-c drivers/block/rnbd/rnbd-clt.c

The offending line will have BAD in front of it.

julia

> drivers/block/rnbd/rnbd-clt.c:  strlcpy(sess->sessname, sessname, sizeof(sess->sessname));
> drivers/input/serio/i8042-x86ia64io.h:  strlcpy(dst, "PNP:", dst_size);
> drivers/input/serio/i8042-x86ia64io.h:  strlcpy(i8042_pnp_kbd_name, did->id, sizeof(i8042_pnp_kbd_name));
> drivers/input/serio/i8042-x86ia64io.h:  strlcpy(i8042_pnp_aux_name, did->id, sizeof(i8042_pnp_aux_name));
> drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h:      strlcpy(buf, bp->acquire_resp.pfdev_info.fw_ver, buf_len);
>
> $ git grep -3 strlcpy drivers/block/rnbd/rnbd-clt.c drivers/input/serio/i8042-x86ia64io.h drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h
> drivers/block/rnbd/rnbd-clt.c-  sess = kzalloc_node(sizeof(*sess), GFP_KERNEL, NUMA_NO_NODE);
> drivers/block/rnbd/rnbd-clt.c-  if (!sess)
> drivers/block/rnbd/rnbd-clt.c-          return ERR_PTR(-ENOMEM);
> drivers/block/rnbd/rnbd-clt.c:  strlcpy(sess->sessname, sessname, sizeof(sess->sessname));
> drivers/block/rnbd/rnbd-clt.c-  atomic_set(&sess->busy, 0);
> drivers/block/rnbd/rnbd-clt.c-  mutex_init(&sess->lock);
> drivers/block/rnbd/rnbd-clt.c-  INIT_LIST_HEAD(&sess->devs_list);
> --
> drivers/input/serio/i8042-x86ia64io.h-
> drivers/input/serio/i8042-x86ia64io.h-static void i8042_pnp_id_to_string(struct pnp_id *id, char *dst, int dst_size)
> drivers/input/serio/i8042-x86ia64io.h-{
> drivers/input/serio/i8042-x86ia64io.h:  strlcpy(dst, "PNP:", dst_size);
> drivers/input/serio/i8042-x86ia64io.h-
> drivers/input/serio/i8042-x86ia64io.h-  while (id) {
> drivers/input/serio/i8042-x86ia64io.h-          strlcat(dst, " ", dst_size);
> --
> drivers/input/serio/i8042-x86ia64io.h-  if (pnp_irq_valid(dev,0))
> drivers/input/serio/i8042-x86ia64io.h-          i8042_pnp_kbd_irq = pnp_irq(dev, 0);
> drivers/input/serio/i8042-x86ia64io.h-
> drivers/input/serio/i8042-x86ia64io.h:  strlcpy(i8042_pnp_kbd_name, did->id, sizeof(i8042_pnp_kbd_name));
> drivers/input/serio/i8042-x86ia64io.h-  if (strlen(pnp_dev_name(dev))) {
> drivers/input/serio/i8042-x86ia64io.h-          strlcat(i8042_pnp_kbd_name, ":", sizeof(i8042_pnp_kbd_name));
> drivers/input/serio/i8042-x86ia64io.h-          strlcat(i8042_pnp_kbd_name, pnp_dev_name(dev), sizeof(i8042_pnp_kbd_name));
> --
> drivers/input/serio/i8042-x86ia64io.h-  if (pnp_irq_valid(dev, 0))
> drivers/input/serio/i8042-x86ia64io.h-          i8042_pnp_aux_irq = pnp_irq(dev, 0);
> drivers/input/serio/i8042-x86ia64io.h-
> drivers/input/serio/i8042-x86ia64io.h:  strlcpy(i8042_pnp_aux_name, did->id, sizeof(i8042_pnp_aux_name));
> drivers/input/serio/i8042-x86ia64io.h-  if (strlen(pnp_dev_name(dev))) {
> drivers/input/serio/i8042-x86ia64io.h-          strlcat(i8042_pnp_aux_name, ":", sizeof(i8042_pnp_aux_name));
> drivers/input/serio/i8042-x86ia64io.h-          strlcat(i8042_pnp_aux_name, pnp_dev_name(dev), sizeof(i8042_pnp_aux_name));
> --
> drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h-static inline void bnx2x_vf_fill_fw_str(struct bnx2x *bp, char *buf,
> drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h-                                      size_t buf_len)
> drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h-{
> drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h:      strlcpy(buf, bp->acquire_resp.pfdev_info.fw_ver, buf_len);
> drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h-}
> drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h-
> drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h-static inline int bnx2x_vf_ustorm_prods_offset(struct bnx2x *bp,
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
