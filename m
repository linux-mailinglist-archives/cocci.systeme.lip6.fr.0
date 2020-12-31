Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A021A2E8240
	for <lists+cocci@lfdr.de>; Thu, 31 Dec 2020 23:41:25 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BVMeunH010485;
	Thu, 31 Dec 2020 23:40:56 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 87D9577D5;
	Thu, 31 Dec 2020 23:40:56 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from osiris.lip6.fr (osiris.lip6.fr [132.227.60.30])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B98AC373F
 for <cocci@systeme.lip6.fr>; Thu, 31 Dec 2020 23:40:54 +0100 (CET)
Received: from smtprelay.hostedemail.com (smtprelay0067.hostedemail.com
 [216.40.44.67])
 by osiris.lip6.fr (8.15.2/8.15.2) with ESMTPS id 0BVMeqBZ024782
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Thu, 31 Dec 2020 23:40:53 +0100 (CET)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 23A348124328
 for <cocci@systeme.lip6.fr>; Thu, 31 Dec 2020 20:13:36 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id B12311802926E;
 Thu, 31 Dec 2020 20:13:32 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:973:982:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1544:1593:1594:1711:1730:1747:1777:1792:1801:2393:2553:2559:2562:2692:2828:3138:3139:3140:3141:3142:3353:3622:3865:3867:3870:3871:3874:4321:4605:5007:6119:7652:7903:10004:10848:11026:11232:11473:11657:11658:11914:12043:12296:12297:12438:12740:12760:12895:13161:13229:13439:14096:14097:14180:14181:14659:14721:21080:21433:21451:21627:21990:30054:30070:30080:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: whip41_03007be274b0
X-Filterd-Recvd-Size: 4970
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Thu, 31 Dec 2020 20:13:31 +0000 (UTC)
Message-ID: <cc5722eb472a0a94f3418f6081b10f3c4a7e156d.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <Julia.Lawall@inria.fr>
Date: Thu, 31 Dec 2020 12:13:30 -0800
In-Reply-To: <58a84d03b714f71d231f9cac04af09a6b97c6f04.camel@perches.com>
References: <58a84d03b714f71d231f9cac04af09a6b97c6f04.camel@perches.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 31 Dec 2020 23:40:58 +0100 (CET)
X-Greylist: Delayed for 02:27:18 by milter-greylist-4.4.3 (osiris.lip6.fr
 [132.227.60.30]); Thu, 31 Dec 2020 23:40:53 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.30
Cc: cocci <cocci@systeme.lip6.fr>
Subject: [Cocci] cocci: missed strlcpy->strscpy conversion?
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

On Thu, 2020-12-31 at 11:04 -0800, Joe Perches wrote:
> strlcpy is deprecated.  see: Documentation/process/deprecated.rst
> 
> Change the calls that do not use the strlcpy return value to the
> preferred strscpy.
> 
> Done with cocci script:
> 
> @@
> expression e1, e2, e3;
> @@
> 
> -	strlcpy(
> +	strscpy(
> 	e1, e2, e3);
> 
> This cocci script leaves the instances where the return value is
> used unchanged.

Hey Julia.

After using the cocci script above on a test treewide conversion,
there were a few instances with no return use that were not converted.

Any idea why these were not converted?
I don't see a pattern.

The .h files may be because those are the only uses in .h files in the kernel
but drivers/block/rnbd/rnbd-clt.c I don't understand at all.

drivers/block/rnbd/rnbd-clt.c:  strlcpy(sess->sessname, sessname, sizeof(sess->sessname));
drivers/input/serio/i8042-x86ia64io.h:  strlcpy(dst, "PNP:", dst_size);
drivers/input/serio/i8042-x86ia64io.h:  strlcpy(i8042_pnp_kbd_name, did->id, sizeof(i8042_pnp_kbd_name));
drivers/input/serio/i8042-x86ia64io.h:  strlcpy(i8042_pnp_aux_name, did->id, sizeof(i8042_pnp_aux_name));
drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h:      strlcpy(buf, bp->acquire_resp.pfdev_info.fw_ver, buf_len);

$ git grep -3 strlcpy drivers/block/rnbd/rnbd-clt.c drivers/input/serio/i8042-x86ia64io.h drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h
drivers/block/rnbd/rnbd-clt.c-  sess = kzalloc_node(sizeof(*sess), GFP_KERNEL, NUMA_NO_NODE);
drivers/block/rnbd/rnbd-clt.c-  if (!sess)
drivers/block/rnbd/rnbd-clt.c-          return ERR_PTR(-ENOMEM);
drivers/block/rnbd/rnbd-clt.c:  strlcpy(sess->sessname, sessname, sizeof(sess->sessname));
drivers/block/rnbd/rnbd-clt.c-  atomic_set(&sess->busy, 0);
drivers/block/rnbd/rnbd-clt.c-  mutex_init(&sess->lock);
drivers/block/rnbd/rnbd-clt.c-  INIT_LIST_HEAD(&sess->devs_list);
--
drivers/input/serio/i8042-x86ia64io.h-
drivers/input/serio/i8042-x86ia64io.h-static void i8042_pnp_id_to_string(struct pnp_id *id, char *dst, int dst_size)
drivers/input/serio/i8042-x86ia64io.h-{
drivers/input/serio/i8042-x86ia64io.h:  strlcpy(dst, "PNP:", dst_size);
drivers/input/serio/i8042-x86ia64io.h-
drivers/input/serio/i8042-x86ia64io.h-  while (id) {
drivers/input/serio/i8042-x86ia64io.h-          strlcat(dst, " ", dst_size);
--
drivers/input/serio/i8042-x86ia64io.h-  if (pnp_irq_valid(dev,0))
drivers/input/serio/i8042-x86ia64io.h-          i8042_pnp_kbd_irq = pnp_irq(dev, 0);
drivers/input/serio/i8042-x86ia64io.h-
drivers/input/serio/i8042-x86ia64io.h:  strlcpy(i8042_pnp_kbd_name, did->id, sizeof(i8042_pnp_kbd_name));
drivers/input/serio/i8042-x86ia64io.h-  if (strlen(pnp_dev_name(dev))) {
drivers/input/serio/i8042-x86ia64io.h-          strlcat(i8042_pnp_kbd_name, ":", sizeof(i8042_pnp_kbd_name));
drivers/input/serio/i8042-x86ia64io.h-          strlcat(i8042_pnp_kbd_name, pnp_dev_name(dev), sizeof(i8042_pnp_kbd_name));
--
drivers/input/serio/i8042-x86ia64io.h-  if (pnp_irq_valid(dev, 0))
drivers/input/serio/i8042-x86ia64io.h-          i8042_pnp_aux_irq = pnp_irq(dev, 0);
drivers/input/serio/i8042-x86ia64io.h-
drivers/input/serio/i8042-x86ia64io.h:  strlcpy(i8042_pnp_aux_name, did->id, sizeof(i8042_pnp_aux_name));
drivers/input/serio/i8042-x86ia64io.h-  if (strlen(pnp_dev_name(dev))) {
drivers/input/serio/i8042-x86ia64io.h-          strlcat(i8042_pnp_aux_name, ":", sizeof(i8042_pnp_aux_name));
drivers/input/serio/i8042-x86ia64io.h-          strlcat(i8042_pnp_aux_name, pnp_dev_name(dev), sizeof(i8042_pnp_aux_name));
--
drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h-static inline void bnx2x_vf_fill_fw_str(struct bnx2x *bp, char *buf,
drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h-                                      size_t buf_len)
drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h-{
drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h:      strlcpy(buf, bp->acquire_resp.pfdev_info.fw_ver, buf_len);
drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h-}
drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h-
drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h-static inline int bnx2x_vf_ustorm_prods_offset(struct bnx2x *bp,

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
